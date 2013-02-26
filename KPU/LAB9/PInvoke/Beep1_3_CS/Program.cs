using System;
using System.Runtime.InteropServices;

namespace Beep1_3_CS
{
    class Program
    {
        private const string DllPath = @"..\..\..\Debug\Beep_3.dll";

        private delegate double CallBack(double value1);

        [DllImport(DllPath, CallingConvention = CallingConvention.Cdecl)]
        static extern void SomeUnmanagedFunctionUsingCallback(double input1, CallBack input2);

        static void Main(string[] args)
        {
            var callBack = new CallBack(Math.Sin);

            SomeUnmanagedFunctionUsingCallback(0.0, callBack);
        }
    }
}
