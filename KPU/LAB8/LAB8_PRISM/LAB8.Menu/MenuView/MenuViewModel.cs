using System.ComponentModel;
using System.Windows.Input;
using LAB8.Infrastructure.Events;
using LAB8.Infrastructure.Interfaces;
using Microsoft.Practices.Prism.Commands;
using Microsoft.Practices.Prism.Events;
using Microsoft.Practices.Unity;

namespace LAB8.Menu.MenuView
{
    public class MenuViewModel : INotifyPropertyChanged 
    {
        private readonly IUnityContainer _container;
        private readonly IEventAggregator _aggregator;

        public MenuViewModel(IUnityContainer container, IEventAggregator aggregator )
        {
            _container = container;
            _aggregator = aggregator;

            ShowLogClick = new DelegateCommand(CanShowLogClick);
            ShowModuleA = new DelegateCommand(CanShowModuleA);
            ShowModuleB = new DelegateCommand(CanShowModuleB);
            ShowModuleC = new DelegateCommand(CanShowModuleC);
            ShowModuleD = new DelegateCommand(CanShowModuleD);
        }

        #region Execute Commands

        private void CanShowModuleD()
        {
            var module = _container.Resolve<ChangeModule>();
            module.SetModule = ModuleName.ModuleD;

            _aggregator.GetEvent<ShowModule>().Publish(module);
        }

        private void CanShowModuleC()
        {
            var module = _container.Resolve<ChangeModule>();
            module.SetModule = ModuleName.ModuleC;

            _aggregator.GetEvent<ShowModule>().Publish(module);
        }

        private void CanShowModuleB()
        {
            var module = _container.Resolve<ChangeModule>();
            module.SetModule = ModuleName.ModuleB;

            _aggregator.GetEvent<ShowModule>().Publish(module);
        }

        private void CanShowModuleA()
        {
            var module = _container.Resolve<ChangeModule>();
            module.SetModule = ModuleName.ModuleA;

            _aggregator.GetEvent<ShowModule>().Publish(module);
        }

        private void CanShowLogClick()
        {
            var module = _container.Resolve<ChangeModule>();
            module.SetModule = ModuleName.Log;

            _aggregator.GetEvent<ShowModule>().Publish(module);
        }

        #endregion

        public ICommand ShowLogClick {set; get; }
        public ICommand ShowModuleA { set; get; }
        public ICommand ShowModuleB { set; get; }
        public ICommand ShowModuleC { set; get; }
        public ICommand ShowModuleD { set; get; }


        #region PropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if(handler != null)
                handler(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}