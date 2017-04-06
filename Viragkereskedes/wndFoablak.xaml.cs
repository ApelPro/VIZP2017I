using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Viragkereskedes_DAL;

namespace Viragkereskedes
{
    public class PéldaAdat
    {
        public string Idő { get; set; }
        public string Összeg { get; set; }
    }
    /// <summary>
    /// Interaction logic for wndFoablak.xaml
    /// </summary>
    public partial class wndFoablak : Window
    {
        public wndFoablak()
        {
            var DataDir = Directory.GetParent(Directory.GetParent(Directory.GetParent(Directory.GetCurrentDirectory()).FullName).FullName) + "\\Viragkereskedes_DAL";
            AppDomain.CurrentDomain.SetData("DataDirectory", DataDir);
            InitializeComponent();
	        
 

        }

        private void btRegisztráció_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void image_MouseEnter(object sender, MouseEventArgs e)
        {
            //Tooltip a kép megjelenítéséhez
            ToolTip ttToViewImage = new ToolTip();
            //Animáció a tooltip megjelenítéséhez
            DoubleAnimation daForToolTip = new DoubleAnimation();

            //Megjelenítendő kép
            Image productImage = new Image();
            //Küldő kép, amelyik kiváltotta az eseményt
            Image senderImage = (Image) sender;

            //Megjelenítendő kép forrása, a küldő kép forrása (Magyarul kinagyítjuk :D)
            productImage.Source = senderImage.Source;

            //Tooltip beállításai
            ttToViewImage.HorizontalContentAlignment = HorizontalAlignment.Center;
            ttToViewImage.VerticalContentAlignment = VerticalAlignment.Center;
            ttToViewImage.Width = 300;
            ttToViewImage.Height = 300;
            ttToViewImage.Content = productImage;
            //Küldő képhez hozzárendeljük a ToolTip-et
            senderImage.ToolTip = ttToViewImage;

            //Animáció
            daForToolTip.From = 0.0001;
            daForToolTip.To = 1;
            daForToolTip.Duration = TimeSpan.FromMilliseconds(1200);
            ttToViewImage.BeginAnimation(OpacityProperty, daForToolTip);
        }

        private void btRózsaKosárba_Click(object sender, RoutedEventArgs e)
        {

        }

        private void chbTATermékÚjFelvétel_Checked(object sender, RoutedEventArgs e)
        {
            cbTATermékek.IsEnabled = false;
            btTAMódosítás.Visibility = Visibility.Hidden;
            btTAFelvétel.Visibility = Visibility.Visible;
            cnViragkereskedes valami = new cnViragkereskedes();
            cbTAKategóriák.ItemsSource = (from x in valami.enCategories select new {x.category_name }).ToList();
        }

        private void chbTATermékÚjFelvétel_Unchecked(object sender, RoutedEventArgs e)
        {
            cbTATermékek.IsEnabled = true;
            btTAFelvétel.Visibility = Visibility.Hidden;
            btTAMódosítás.Visibility = Visibility.Visible;
        }
    }
}
