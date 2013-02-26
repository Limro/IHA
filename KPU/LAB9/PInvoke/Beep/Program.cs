using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Beep
{
    class Program
    {
        [DllImport("User32.dll")]
        public static extern bool MessageBeep(int type);

        [DllImport("Kernel32.dll")]
        public static extern bool Beep(int freq, int duration);

        static void Main(string[] args)
        {
            var soundType = 0xFFFFFFF;
            MessageBeep(soundType);

            var freq = 1500;
            var duration = 500;
            Beep(freq, duration);
        }
    }
}
