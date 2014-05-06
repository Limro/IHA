	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM ltl_0 */
;
		;
		;
		;
		
	case 5: /* STATE 13 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 6: /* STATE 1 */
		;
		_m = unsend(now.ch[0]);
		;
		goto R999;

	case 7: /* STATE 2 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: /* STATE 3 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: /* STATE 4 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: /* STATE 6 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P */

	case 11: /* STATE 1 */
		;
		now.incrit[ Index(((P0 *)this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 12: /* STATE 5 */
		;
		((P0 *)this)->pidx = trpt->bup.ovals[3];
		((P0 *)this)->requester = trpt->bup.ovals[2];
		((P0 *)this)->waiting = trpt->bup.ovals[1];
		((P0 *)this)->holding = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 13: /* STATE 6 */
		;
		XX = trpt->bup.ovals[0];
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 0, 3, 1);
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, ((int)((P0 *)this)->requester), 0);
		((P0 *)this)->requester = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 14: /* STATE 7 */
		;
	/* 0 */	((P0 *)this)->holding = trpt->bup.oval;
		;
		;
		goto R999;

	case 15: /* STATE 8 */
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)this)->requester), 3) ]);
		;
		goto R999;

	case 16: /* STATE 9 */
		;
		((P0 *)this)->holding = trpt->bup.oval;
		;
		goto R999;

	case 17: /* STATE 11 */
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)this)->id), 3) ]);
		;
		goto R999;

	case 18: /* STATE 14 */
		;
		XX = trpt->bup.ovals[0];
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 0, 2, 1);
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, trpt->bup.ovals[1], 0);
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: /* STATE 17 */
		;
		((P0 *)this)->pidx = trpt->bup.ovals[2];
		((P0 *)this)->waiting = trpt->bup.ovals[1];
		((P0 *)this)->holding = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		;
		;
		
	case 22: /* STATE 20 */
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]);
		;
		goto R999;

	case 23: /* STATE 25 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 24: /* STATE 25 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 25: /* STATE 31 */
		;
		critical = trpt->bup.oval;
		;
		goto R999;

	case 26: /* STATE 32 */
		;
		now.incrit[ Index(((P0 *)this)->id, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 27: /* STATE 33 */
		;
		critical = trpt->bup.oval;
		;
		goto R999;

	case 28: /* STATE 35 */
		;
		((P0 *)this)->pidx = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->waiting = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		
	case 31: /* STATE 38 */
		;
		_m = unsend(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]);
		;
		goto R999;

	case 32: /* STATE 43 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 33: /* STATE 43 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 34: /* STATE 49 */
		;
		((P0 *)this)->waiting = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 36: /* STATE 51 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 37: /* STATE 52 */
		;
	/* 0 */	((P0 *)this)->pidx = trpt->bup.oval;
		;
		;
		goto R999;

	case 38: /* STATE 53 */
		;
	/* 0 */	((P0 *)this)->pidx = trpt->bup.ovals[2];
		XX = trpt->bup.ovals[0];
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 0, 1, 1);
		unrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, ((int)((P0 *)this)->pidx), 0);
		((P0 *)this)->pidx = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 39: /* STATE 57 */
		;
		((P0 *)this)->pidx = trpt->bup.oval;
		;
		goto R999;

	case 40: /* STATE 67 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

