using LAB8.Infrastructure.Events;
using LAB8.Infrastructure.Interfaces;
using Microsoft.Practices.Prism.Modularity;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.Unity;

namespace LAB8.Infrastructure
{
    public class InfrastructureModule : IModule
    {
        private readonly IUnityContainer _container;
        private readonly IRegionManager _manager;

        public InfrastructureModule(IUnityContainer container, IRegionManager manager)
        {
            _container = container;
            _manager = manager;
            RegisterServicesAndViews();
        }

        private void RegisterServicesAndViews()
        {
            _container.RegisterType<ChangeModule>();
            _container.RegisterType<ShowModule>();
        }

        public void Initialize()
        {
            //_container.Resolve<IChangeModule>();
        }
    }
}