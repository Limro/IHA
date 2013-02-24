using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Input;
using LAB8.Infrastructure.Events;
using LAB8.Infrastructure.Interfaces;
using Microsoft.Practices.Prism.Events;
using Microsoft.Practices.Unity;

namespace LAB8.LogModule.Log
{
    public class LogViewModel : INotifyPropertyChanged 
    {
        private readonly IUnityContainer _container;
        private readonly IEventAggregator _aggregator;
        private SubscriptionToken _subscriptionToken;

        private ObservableCollection<string> _output;
        public ObservableCollection<string> Output
        {
            get { return _output; }
            set
            {
                _output = value;

                OnPropertyChanged("Output");
            }
        }

        public LogViewModel(IUnityContainer container, IEventAggregator aggregator)
        {
            _container = container;
            _aggregator = aggregator;
            _output = new ObservableCollection<string>();

            SubscribeEvents();
        }

        private void SubscribeEvents()
        {
            var moduleChange = _aggregator.GetEvent<ShowModule>();

            if (_subscriptionToken != null)
            {
                moduleChange.Unsubscribe(_subscriptionToken);
            }

            _subscriptionToken = moduleChange.Subscribe(ChangeModule, ThreadOption.UIThread, true);
        }

        private void ChangeModule(ChangeModule obj)
        {
            switch(obj.SetModule)
            {
                case ModuleName.Log:
                    Output.Add("Log module called");
                    break;

                case ModuleName.ModuleA:
                    Output.Add("ModuleA called");
                    break;

                case ModuleName.ModuleB:
                    Output.Add("ModuleB called");
                    break;

                case ModuleName.ModuleC:
                    Output.Add("ModuleC called");
                    break;

                case ModuleName.ModuleD:
                    Output.Add("ModuleD called");
                    break;
            }
        }

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