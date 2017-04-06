using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viragkereskedes_DAL;

namespace Viragkereskedes
{
    class Order_Sql
    {
        public List<OrderList> UserOrders(int uid)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                return context.enOrders.Where(x => x.enUsers.user_id == uid).Select(x => new OrderList() { Id = x.order_id, price = x.order_price, OrderDate = x.order_date}).ToList();
            }
        }

        public List<DetailsList> OrderDetails(int oid)
        {
            List<enOrder> Orders = new List<enOrder>();
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                Orders = context.enOrders.Where(x => x.order_id == oid).ToList();
                List<DetailsList> oDetails = new List<DetailsList>();
                var DetailsId = context.enOrder_details.Where(x => x.enOrders == Orders).ToList();
                foreach(var x in DetailsId)
                {
                    oDetails.Add(new DetailsList() { ProductName = x.pName, ProdAmount = x.product_amount, ProdPrice = x.product_price });
                }

                return oDetails;
            }
        }

        public void InsertOrder(List<OrderList> oList, List<DetailsList> dList, int uid)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                var CurrentUser = context.enUsers.Where(x => x.user_id == uid).First();
                var NewOrder = new enOrder();
                foreach(var x in oList)
                {
                    NewOrder = context.enOrders.Add(new enOrder() { order_price = x.price, order_date = x.OrderDate, enUsers = CurrentUser });
                    context.enOrders.Add(NewOrder);
                }
                foreach (var x in dList)
                {
                    var CurrentProduct = context.enProducts.Where(y => y.product_name == x.ProductName).ToList();
                    NewOrder.enOrder_detail.Add(new enOrder_detail() { enProduct = CurrentProduct, product_amount = x.ProdAmount, product_price = x.ProdPrice });
                }
            }
        }
    }
}
