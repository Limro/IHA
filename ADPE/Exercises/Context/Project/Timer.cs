using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Project
{
	class Timerss
	{

		public async Task<string> SleepAsync(int millisecondsTimeOut)
		{
			TaskCompletionSource<bool> tcs = null;
			var t = new Timer(delegate { tcs.TrySetResult(true);}, null, -1, -1);
			tcs = new TaskCompletionSource<bool>(t);
			t.Change(millisecondsTimeOut, -1);
			await Console.WriteLine("Hejsan");
			return "Hejsan";
			//return tcs.Task;
		}
	}
	

	class StateObjClass
	{
		// Used to hold parameters for calls to TimerTask. 
		public int SomeValue;
		public System.Threading.Timer TimerReference;
		public bool TimerCanceled;
	}
}
