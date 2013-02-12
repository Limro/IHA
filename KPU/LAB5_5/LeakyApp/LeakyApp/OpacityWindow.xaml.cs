using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LeakyApp
{
    /// <summary>
    /// Interaction logic for OpacityWindow.xaml
    /// </summary>
    public partial class OpacityWindow : Window
    {
        double[] emptySpace = new double[11 * 1024 * 1024];

        public OpacityWindow()
        {
            InitializeComponent();
        }

        public OpacityWindow(MainWindow mainWin)
        {
            InitializeComponent();
            mainWin.OpacityChanged += new LeakyApp.MainWindow.OpacityChangedEventHandler(mainWin_OpacityChanged);
        }

        public void mainWin_OpacityChanged(object sender, OpacityChangedEventArgs e)
        {
            Opacity = e.Opacity;
        }
    }
}
