using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viragkereskedes_DAL;

namespace Viragkereskedes
{
    class Products_Sql
    {
        private List<ProductsList> Prod;
        private Dictionary<string, int> ProdAmount;
        private Dictionary<string, int> AccessoryAmount;
        private bool Bouquet = false;

        public Products_Sql() { }
        public Products_Sql(List<ProductsList> SingleProduct)
        {
            Prod = new List<ProductsList>(SingleProduct);
            if (IsProductExists())
            {
                InsertProduct();
            }
            else
            {
                throw new Exception("A termék már létezik!");
            }
        }

        public Products_Sql(List<ProductsList> BouquetProduct, Dictionary<string, int> ContainedProducts, Dictionary<string, int> UsedAccessories)
        {
            Prod = new List<ProductsList>(BouquetProduct);
            ProdAmount = new Dictionary<string, int>(ContainedProducts);
            AccessoryAmount = new Dictionary<string, int>(UsedAccessories);
            Bouquet = true;
            if (IsProductExists())
            {
                InsertProduct();
            }
            else
            {
                throw new Exception("A termék már létezik!");
            }
        }

        private bool IsProductExists()
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                string IsName="";
                foreach (var x in Prod)
                {
                    IsName = x.Name;
                }

                var IsExists = context.enProducts.Where(x => x.product_name == IsName).Select(x => x.product_id);
                if(IsExists.Count() > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        private void InsertProduct()
        {
            using (cnViragkereskedes context = new cnViragkereskedes())
            {
                foreach (var x in Prod)
                {
                    var CategoryId = context.enCategories.First(a => a.category_name == x.CategoryName);
                    var NewProduct = new enProduct() { product_name = x.Name, product_price_net = x.NetPrice, product_fees = x.Fees, product_sale = x.Sale, product_description = x.Description, product_icon = x.Icon, product_active = x.Active, enCategory = CategoryId, product_price_gross=x.GrossPrice };
                    if (Bouquet)
                    {
                        foreach (var UsedAccessories in AccessoryAmount)
                        {
                            var AccessoryName = context.enAccessories.First(a => a.accessory_name == UsedAccessories.Key);
                            NewProduct.enAccessory_vs_product.Add(new enAccessory_vs_product() { enAccessory = AccessoryName, accessory_amount=UsedAccessories.Value});
                        }
                        foreach (var UsedProducts in ProdAmount)
                        {
                            var ProductName = context.enProducts.Where(a => a.product_name == UsedProducts.Key).ToList();
                            NewProduct.enBouquets.Add(new enBouquet() { enProducts = ProductName, product_amount = UsedProducts.Value });
                        }
                    }
                    context.enProducts.Add(NewProduct);
                }
                context.SaveChanges();
            }
        }

        public List<ProductsList> ListingProducts(bool onSale)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                if (!onSale)
                {
                    return context.enProducts.Where(x => x.product_active == true).Select(x => new ProductsList() { Name = x.product_name, NetPrice = x.product_price_net, Fees = x.product_fees, Sale = x.product_sale, Description = x.product_description, Icon = x.product_icon, Active = x.product_active, CategoryName = x.enCategory.category_name, GrossPrice=x.product_price_gross }).ToList();
                }
                else
                {
                    return context.enProducts.Where(x => x.product_sale == true && x.product_active == true).Select(x => new ProductsList() { Name = x.product_name, NetPrice = x.product_price_net, Fees = x.product_fees, Sale = x.product_sale, Description = x.product_description, Icon = x.product_icon, Active = x.product_active, CategoryName = x.enCategory.category_name, GrossPrice=x.product_price_gross }).ToList();
                }
            }
        }

        public bool ModifyProduct(List<ProductsList> CProd)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                var ProductToChange=new enProduct();
                foreach (var prod in CProd)
                {
                    ProductToChange = context.enProducts.Where(x => x.product_name == prod.Name).First();
                    ProductToChange.product_name = prod.Name;
                    ProductToChange.product_price_net = prod.NetPrice;
                    ProductToChange.product_fees = prod.Fees;
                    ProductToChange.product_sale = prod.Sale;
                    ProductToChange.product_description = prod.Description;
                    ProductToChange.product_icon = prod.Icon;
                    ProductToChange.product_active = prod.Active;
                    ProductToChange.product_price_gross = prod.GrossPrice;
                }
                context.Entry(ProductToChange).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
                return true;
            }
        }
    }
}
