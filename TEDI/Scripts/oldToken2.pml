byte critical = 0;

#define nostarve (incrit[0] && incrit[1] && incrit[2])
bool incrit[3];

// Only 3 types of messages, request token or taken granted
mtype {req,gra,brag};
chan ch [3] = [3] of {mtype, byte};

proctype P(byte id)
{
	byte reset = 5;
	byte requests[3];
	requests[0] = reset; //Set value to invalid id
	requests[1] = reset;
	requests[2] = reset;


	// Initialise stuff
	incrit[id] = false;
	bool holding = false;
	bool waiting = false;
	byte requester;
    byte pidx;
	byte arrId;
	bool done = false;

	end:

	do
	// Token request received - insert in array
	:: ch[id] ?? req,requester;
		done = false;
		for ( arrId : 0 .. 2)
          {
		    if
			:: (requests[arrId] == reset); 
				if
				:: done == true;
					skip;
				:: else
	               requests[arrId] = requester;
					done = true;
				fi
			:: else -> skip;
			fi
		  }
		done = false;

	//CS has been applied. Send token to next
   :: holding == true;
	  for( arrId : 0 .. 2 )
	  {
		if
		:: requests[arrId] != reset;
			ch[requests[arrId]] ! gra,id;
			requests[arrId] = reset;		// reset array slot
  		    holding = false;				// not holding
			skip;							// and stop looking for more
		:: else -> skip;
		fi
	  }

	// If brag, set requests-array slot to reset
	:: ch[id] ?? brag,requester;
		for( arrId : 0 .. 2 )
		  {
			if
			:: requests[arrId] == requester;
				requests[arrId] = reset;		// reset array slot
			:: else -> skip;
			fi
		  }
		

	// Token granted
	:: ch[id] ?? gra,_; //No matter from who...
	   holding = true;
       waiting = false;

		 // Broadcast receiving token
		  for (pidx : 0 .. 2)
          {
		    if
			:: (pidx != id); // Don't send request to ourselves
               ch[pidx] ! brag,id
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
               ch[pidx] ! req,id
			:: else -> skip
			fi
		  }
       waiting = true;
	od;
}

init
{
	// Send a single token into the system
	ch[0] ! gra,0;

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
