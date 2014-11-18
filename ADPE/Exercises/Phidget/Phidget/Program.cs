using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phidgets;
using System.Speech.Synthesis;

namespace PhidgetApp
{

	class Program
	{
		private static Phidgets.InterfaceKit ifkit;
		static private int i = 1;
		static void Main(string[] args)
		{
			

			Action<object> Run = (object obj) =>
			{
				Console.WriteLine("S'up");
			};

			//Create an interface kit to communicate
			ifkit = new InterfaceKit();
			//Use bonjour to discover the SBC computer on the network
			ifkit.open("phidgetsbc");
			//Wait fo rattachment
			ifkit.waitForAttachment();

			//Setup an event listener
			ifkit.SensorChange += ifkit_SensorChange;
			//InitializeStateMachine();
			//DisplayWelcomeScreen();

			// Initializee a “run” task for executing a timed service.
			var task = new Task(Run, 2);
			task.Start();
			Console.ReadKey();
			//running = false;
		}

		static void ifkit_SensorChange(object sender, Phidgets.Events.SensorChangeEventArgs e)
		{
			//e.Index = 0 is the PIR movement sensor for detecting user entry
			if (e.Index == 0 && (e.Value > 550 || e.Value < 450))
			{
				//UserSpotted(e);
			}
			//e.Index = 7 is the medicaiton box sensor
			if (e.Index == 7 && e.Value < 125)
			{
				MedicationTaken(e);
			}
			if (e.Index == 7 && e.Value > 450)
			{
				//MedicationSetBack(e);
			}
		}

		static void MedicationTaken(object val)
		{
			// Initialize a new instance of the SpeechSynthesizer.
			using (SpeechSynthesizer synth = new SpeechSynthesizer())
			{
				// Remove the below for UK/US version of speech – or replace da-DK
				synth.SelectVoiceByHints(VoiceGender.Female, VoiceAge.Adult);

				// Configure the audio output. 
				synth.SetOutputToDefaultAudioDevice();
				
				// Speak a string synchronously.
				//synth.Speak("Good morning. Please remember to take your medication.");
				string s = "Medicin said time" + i + "times";
				synth.Speak(s);
				i++;
			}
		}


	}
}
