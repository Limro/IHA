# Transport layer

Står for at holde end-to-end / host-to-host forbindelsen.

## Reliability
* Packet reliability
	* Så længe man ved hvad der går tabt, er det fint
* ...

## Detect and signaling losses in single packet delivery
* Kan kun sende positive ACK-beskeder.
* Link layer vil lade hver node sende beskeder igen, hvis de misser deres pakke
	* Transport layer vil sende pakken igen fra source.

* Brug link layer, hvis routen er længere (slide 13+14).

## Blocks i packets
* Hvis man sender blokke, kan man se på huller hvad der mangler.
* Den sensor der ikke modtager en pakke, sender et NACK


