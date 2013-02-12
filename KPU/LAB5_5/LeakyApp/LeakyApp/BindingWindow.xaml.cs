using System;
using System.ComponentModel;
using System.Windows;

namespace LeakyApp
{
    /// <summary>
    /// Interaction logic for BindingWindow.xaml
    /// </summary>
    public partial class BindingWindow : Window, IDisposable
    {
        private int[] emptySpace = new int[27*1024*1024];

        public BindingWindow()
        {
            InitializeComponent();
        }

        ~BindingWindow()
        {
            emptySpace = null;
        }

        public BindingWindow(Model model)
        {
            InitializeComponent();
            this.DataContext = model;
        }

        private void BindingWindow_OnClosing(object sender, CancelEventArgs e)
        {
            Dispose();
        }

        private bool disposed = false;

        public void Close()
        {
            Dispose();
        }

        public void Dispose()
        {
            // Dispose managed and unmanaged resources.
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                }
            }
            disposed = true;
        }
    }
}
