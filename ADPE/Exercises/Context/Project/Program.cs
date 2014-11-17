using System;
using System.Speech.Synthesis;
using Project;

namespace SampleSynthesis
{
	class Program
	{
		static void Main(string[] args)
		{

			var reader = new Reader();
			var timer = new Timerss();
	
			Messages.

			var res = timer.SleepAsync(2000).Result();

			Console.WriteLine(res);

			reader.Read("Hello");
			reader.Read("Remember: a train says toot");

			Console.WriteLine("Press any key to exit...");
			Console.ReadKey();
		}
	}

	public List<string> Messages = new List<string>();

	class Reader
	{
		SpeechSynthesizer syn;

		public Reader()
		{
			syn = new SpeechSynthesizer();
			syn.SetOutputToDefaultAudioDevice();
		}

		public void Read(string message)
		{
			syn.Speak(message);
		}




	}

}