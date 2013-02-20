using System;
using System.ComponentModel.Composition;
using Infrastructure;

namespace DllClass
{
    [Export(typeof(IDllClass))]
    public class DllClass : IDllClass
    {
        public bool Init()
        {
            Console.WriteLine("Initiating DllClass");
            return true;
        }

        public bool Run()
        {
            Console.WriteLine("Now running the DllClass!");
            Console.WriteLine(AppUtil.GetName());
            return true;
        }

        public void TearDown()
        {
            Console.WriteLine("Tearing down DllClass");
        }

        [Import]
        public IAppUtil AppUtil { set; get; }
    }
}