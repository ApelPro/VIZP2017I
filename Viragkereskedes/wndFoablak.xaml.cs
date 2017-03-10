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
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Viragkereskedes
{
    /// <summary>
    /// Interaction logic for wndFoablak.xaml
    /// </summary>
    public partial class wndFoablak : Window
    {
        public wndFoablak()
        {
            InitializeComponent();
            // Új stack panel hozzáadása új termék megjelenítéséhez
            // StackPanel sp2 = new StackPanel();
            // spTermékek.Children.Add(sp2);
            // sp2.Children.Add(new TextBox());
        }
    }
}
