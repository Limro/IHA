using System.Windows.Controls;

namespace LAB8.LogModule.Log
{
    /// <summary>
    /// Interaction logic for LogView.xaml
    /// </summary>
    public partial class LogView : UserControl
    {
        private readonly LogViewModel _viewModel;

        public LogView(LogViewModel viewModel)
        {
            _viewModel = viewModel;
            InitializeComponent();
            DataContext = _viewModel;
        }
    }
}
