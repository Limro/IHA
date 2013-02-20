using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Reflection;
using Infrastructure;

namespace ConsoleApp
{
    class Program
    {
        [ImportMany(AllowRecomposition = true)]
        public IEnumerable<IDllClass> DllClasses { get; set; }

        public static void Main(string[] args)
        {
            var p = new Program();
            p.Compose();

            p.Run();
        }

        private void Run()
        {
            foreach (var cl in DllClasses)
            {
                cl.Init();
                cl.Run();
                cl.TearDown();
            }

            Console.ReadKey();
        }


        private void Compose()
        {
            var assCatalog = new AssemblyCatalog(Assembly.GetExecutingAssembly());
            
            var dirCatalog = new DirectoryCatalog(@".\Extensions");

            var aggregateCatalog = new AggregateCatalog(assCatalog, dirCatalog);

            var container = new CompositionContainer(aggregateCatalog);
            container.ComposeParts(this);
        }
    }

    public class Demo
    {
        private readonly IDllClass _dllClass;

        [ImportingConstructor]
        public Demo(IDllClass dllClass)
        {
            _dllClass = dllClass;
        }

        public bool Init()
        {
            return _dllClass.Init();
        }

        public bool Run()
        {
            return _dllClass.Run();
        }

        public void TearDown()
        {
            _dllClass.TearDown();
        }
    }
}
