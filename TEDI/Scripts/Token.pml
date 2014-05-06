// Define's and ghost variables for checking mutex &
// starvation properties
#define mutex (critical <= 1)
byte critical = 0;
#define nostarve (incrit[0] && incrit[1] && incrit[2])
bool incrit[3];

// Only 2 types of messages, request token or taken granted
mtype {tokreq,tokgrant,tokrec};
chan ch [3] = [3] of {mtype, byte};

proctype P(byte id)
{
	// Initialise stuff
	incrit[id] = false;
	bool holding = false;
	bool waiting = false;
	byte requester;
    byte pidx;

	end:

	do
	// Token request received
	:: ch[id] ?? tokreq,requester;
	   if
	   :: holding;
          ch[requester] ! tokgrant,id;
		  holding = false;
		:: else /* stash it for later */
			ch[id] ! tokreq, requester;
		fi

	// Token granted
	:: ch[id] ?? tokgrant,_; //No matter from who...
	   holding = true;
       waiting = false;

		 // Broadcast receiving token
		  for (pidx : 0 .. 2)
          {
		    if
			:: (pidx != id); // Don't send request to ourselves
               ch[pidx] ! tokrec,id
			:: else -> skip
			fi
		  }
    
	   critical++; // Enter & leave CR
	   incrit[id] = true;
	   critical--;

	// If there are no messages in queue and we don't have
	// the token (and we haven't asked for it yet), request token
	:: !holding && !waiting;
		  // Broadcast request for token
		  for (pidx : 0 .. 2)
          {
		    if
			:: (pidx != id); // Don't send request to ourselves
               ch[pidx] ! tokreq,id
			:: else -> skip
			fi
		  }
       waiting = true;

       //Received more than there's requests?
    :: len(ch[id]) < 2;
    	atomic {
    		for (pidx : 0 .. len(ch[id]))
    		{
    			do
    			:: ch[id] ?? tokrec, pidx;
    			od;
    		}
    	}
	od;
}

init
{
	// Send a single token into the system
	ch[0] ! tokgrant,0;
	// and start the processes.
	atomic {
		run P(0);
		run P(1);
		run P(2);
	}

}

// LTL Formulas - uncomment as needed
// * Check for mutual exclusion
// ltl{[]mutex}    
// * Check for starvation
 ltl{[]<>nostarve}