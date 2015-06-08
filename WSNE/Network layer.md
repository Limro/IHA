# Network layer
Holder styr på topology og router information fra én node til en anden, abitrær node.

*Hvordan finder man en path og den mest optimale?*

* Find de mulige paths
* Find den bedste metric (hvor lang tid det tager at sende igennem)
	* Flere hubs kan være bedre, hvis de har bedre throughput end færre hubs har

## ID-centric routing

En mekanisme til at sende fra A til vilkårlig B.

* Lav routing table
* ...

Udfordringer:

* Hvis man bevæger sig rundt, skifter ens routing table og topology
* Energy effecieny når man performer et hop

## WSN routing protocols

Hver gang man vil sende noget rediscover man sine routings.

* Meget stort over head.
* Langsom til at se ændringer.
* Bruger eks. Dijkstra's algoritme

Løs ved flooding:
* Ingen brug for routing
* Hvis du modtager data, så broadcast til alle - de kan sende det videre

## Flooding and Gossiping
* Flooding
	* Broadcast alle pakker der modtages
	* Maksimalt antal hops

* Gossiping
	* Send til andre noder med en hvis sandsynlighed.

Problemer med dette:
* Implision - Alt data sendes til alle
* Overlap - en enhed kan modtage samme data flere gange
* Resource blindness - sender alt de kan
* Energy effeciency - Sender ALT de kan.

## Energy-efficiet unicast
* Hver hub har en 'cost' 
* Forsøg at finde den mindst kostbare path.
	* Hastighed
	* Mest batteri på hele dens path

## Broad-/Multicast

Send til én - send til mange

## Find Broadcast incremental pwoer (BIP)
Brug så lidt power as possible

* Den smalede mængde power skal være så lille som muligt.

## Data centric

* Man har ikke brug for en bestemt sensors ID.
* Man spørger normalt "hvem har temperatur over 30?"
	* Eller "Hvor mange er der i et rum?"

### One-shot interaction: SPIN
Sensor Protocol for Information via Negotiation.

Bruger 3 former for data:
* ADV - Data advertisement
	* Er det interssant data?
	* Hvis, send et REQ
* REQ - Request for data
	* Spørger, når den ønsker data.
* DATA
	* Meget større end ADV og REQ
	* Indeholder også en header med meta-data-

Typer:
* SPIN-EC (energy conservation)
	* Opfører sig som SPIN-PP + low-energy threshold (de skal have minimum så meget energy)
	* Vil ikke lave et REQ på et ADV, hvis den ikke har nok enegery
	* Skal have nok energy for at den kan opholde alle 3 stadier.
* SPIN-RL
	* SPIN-BC + reliable transmission


### Repeated interactions: Directed Diffusion
* Publish/subscribe