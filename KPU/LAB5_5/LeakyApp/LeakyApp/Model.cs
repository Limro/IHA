using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace LeakyApp
{
    public class Model : INotifyPropertyChanged
    {
        ObservableCollection<string> data = new ObservableCollection<string>();

        public event PropertyChangedEventHandler PropertyChanged;

        public Model()
        {
            data.Add("en");
            data.Add("to");
            data.Add("tre");
        }

        string userName;

        public string UserName
        {
            get { return userName; }
            set
            {
                if (userName != value)
                {
                    userName = value;
                    Notify("UserName");
                }
            }
        }

        public ObservableCollection<string> Data
        {
            get { return data; }
        }

        private void Notify(string p)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(p));
        }
    }
}


