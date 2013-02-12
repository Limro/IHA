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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LeakyApp
{ 
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Model model = new Model();

        public MainWindow()
        {
            InitializeComponent();
        }

        #region OpacityChanged event

        public delegate void OpacityChangedEventHandler(Object sender, OpacityChangedEventArgs e);
        public event OpacityChangedEventHandler OpacityChanged;

        #endregion OpacityChanged event

        #region Event handlers

        private void btnForceGC_Click(object sender, RoutedEventArgs e)
        {
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
        }

        private void btnNameWindow_Click(object sender, RoutedEventArgs e)
        {
            NameWindow nameWindow = new NameWindow(this);
            tbxName.TextChanged += new TextChangedEventHandler(nameWindow.mainWin_NameChanged); 
            nameWindow.Show();
        }
        

        private void sldOpacity_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            double opacity = e.NewValue / 100.0;
            if (OpacityChanged != null)
                OpacityChanged(this, new OpacityChangedEventArgs(opacity));
        }

        private void btnOpacity_Click(object sender, RoutedEventArgs e)
        {
            OpacityWindow wnd = new OpacityWindow(this);
            wnd.Show();
        }

        private void btnFileWindow_Click(object sender, RoutedEventArgs e)
        {
            FileWindow wnd = new FileWindow(this);
            wnd.Show();
        }
 
        private void btnBinding_Click(object sender, RoutedEventArgs e)
        {
            var wnd = new BindingWindow(model);
            wnd.Show();
        }

        private void tbxName_TextChanged(object sender, TextChangedEventArgs e)
        {
            model.UserName = tbxName.Text;
        }
        
        #endregion Event handlers
    }

    public class OpacityChangedEventArgs : EventArgs
    {
        private Double _value;

        public Double Opacity
        {
            get { return _value; }
            set { _value = value; }
        }

        public OpacityChangedEventArgs(Double value)
        {
            _value = value;
        }
    }

    public class NameChangedEventArgs : EventArgs
    {
        private string _value;

        public string Opacity
        {
            get { return _value; }
            set { _value = value; }
        }

        public NameChangedEventArgs(string value)
        {
            _value = value;
        }
    }

}
