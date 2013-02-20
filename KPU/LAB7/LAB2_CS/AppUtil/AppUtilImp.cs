using System.ComponentModel.Composition;
using Infrastructure;

namespace AppUtil
{
    [Export(typeof(IAppUtil))]
    public class AppUtilImp : IAppUtil
    {
        public AppUtilImp()
        {
            _name = "Mig";
        }
        private string _name;
        public string GetName()
        {
            return _name;
        }

        public string MyAddString(string str1, string str2)
        {
            _name = str1 + str2;
            return _name;
        }
    }
}