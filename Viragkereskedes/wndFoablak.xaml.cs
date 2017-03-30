using System;
using System.Collections.Generic;
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

namespace Viragkereskedes
{
    /// <summary>
    /// Interaction logic for wndFoablak.xaml
    /// </summary>
    public partial class wndFoablak : Window
    {

        // public TimeSpan
        public wndFoablak()
        {
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
    }
}
