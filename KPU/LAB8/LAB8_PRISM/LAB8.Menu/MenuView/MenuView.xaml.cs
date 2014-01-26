using System.Windows.Controls;

namespace LAB8.Menu.MenuView
{
    /// <summary>
    /// Interaction logic for MenuView.xaml
    /// </summary>
    public partial class MenuView : UserControl
    {
        private readonly MenuViewModel _viewModel;

        public MenuView(MenuViewModel viewModel)
        {
            _viewModel = viewModel;
            InitializeComponent();
            DataContext = _viewModel;
        }
    }
}
