# Linked layer
## ARC
Hvis A sender til B og B ikke modtager CRC=true, vil B sende NACK retur og få en ny pakke.

A kan også sætte en timer, så hvis den ikke får et ACK inden for timer, vil den retransmitte sin data.

Hvis man bliver ved med at skulle sende samme pakke igen og igen (men ikke mere end *x* gange, bounded), har man et semi-reliable resultat. 

Man kan sende i bursts.
* Go-back-N:
	
	Dette vil gå tilbage til en NACK, og sende alt herfra

* Selective repeat:

	Vil kun sende den pakke som mangler, og så fortsætte hvor den slap.

