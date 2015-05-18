# MAC protocol

## Contention-based protocols

En scheduler fortæller hvem der har time slot.
Alt skal her være synkroniseret, hvilket kan være svært ved store netværk (bør derfor undlades).

* Overhearing
* Collision
* Idle listening

## Contention (random based)
* Skalerer bedre og er mere agilt.

* Jo flere nodes, jo flere collisions.

* Bruder Carrier sense (lytter efter, hvornår de kan komme til).

### CSMA/CA

Problemet med dette er, hvis en node ikke kan nåes af en anden.
Når en node sender og en anden ikke kan høre det, vil den anden sende på samme tid. 
Dette giver collisions. 
For at undgå dette, bruges RTS/CTS algoritmen.

#### RTS/CTS

A sender RTS (Request to send) packet.
B svarer med CTS (Clear to send) packet
A sender data.

Andre der modtager RTS fra A (eller CTS fra B), kan beregne hvor lang tid det tager, før de selv kan sende et RTS.

Desværre kan forskydelser gøre, at enheder modtager RTS igen fra andre noder, før de har broadcasted deres CTS.


### S-MAC
Bygger på det normale MAC, men bruger sleep og listening.
Men listening bruger desværre power.

Bytter energi ud med throughput er mindre og højere latency.

I en SYNC packet sendes eget ID samt en sleep timer.
De skal helst alle have samme sleep cycle.
Men over tid vil de billige krystaller være ude af sync.
Dette skyldes, at der kan gå 100 sleep cycles, før der kommer et SYNC.

**Synchronization maintenance**:

Hver node holder styr på, hvilke naboer den har:

- Lyt lidt tid

-- Hvis ingen, vælg eget schedule.

-- Hvis, vælg dennes skema som follower og broadcast næste gang den skal fortælle om det.

- Hvis den efterfølgende modtager 2 forskellige skemaer, brug dem begge.

#### Adaptive listening feature

Reducerer latency.

I stedet for at sove, hvis den ikke modtager noget antager den, at naboen modtager noget og den selv vil få noget senere. 
Den forbliver derfor vågen.

#### Overhearing avoidance

Hvem der kan snakke...

#### Message passing
Skær større pakker i mindre stykker.
Mindre pakker giver mere overhead

### B-MAX
#### Clear channel assesment
Formlen kan tunes til større vægtning af de forskellige variabler (slide 34).

Hvis man over 5 samples finder noget under noise floor, er man i idle state

#### Low power listening
* Hvornår vågner din nabo?

* Der skal ikke udveksles pakker

Send en (lang) preamble. 
Receiver checker intervaller. 
Hvis efter et interval preamblen stadig sendes, så må der komme data inden for en hvis timer.

## Schedule-based
### TRAMA: TRaffic-Adaptive Medium Access
Består af nogle under-protokoller.

#### Neighbor Protocol (NP)
Send dine naboer til dine naboer, så de kender dem (frem og tilbage).
Kaldes også Two Hop.

#### Schedule Exchange Protocol (SEP)
Af alle de nabo der *kan* haves (1000), annonceres på et "winning slot" (den sidste af et interval af 100), hvilken scheduler der skal bruges.
Denn pakke indeholder data (slide 49).