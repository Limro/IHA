#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM ltl_0 */
	case 3: /* STATE 1 - _spin_nvr.tmp:3 - [(!(((incrit[0]&&incrit[1])&&incrit[2])))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!( !(((((int)now.incrit[0])&&((int)now.incrit[1]))&&((int)now.incrit[2])))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 8 - _spin_nvr.tmp:8 - [(!(((incrit[0]&&incrit[1])&&incrit[2])))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][8] = 1;
		if (!( !(((((int)now.incrit[0])&&((int)now.incrit[1]))&&((int)now.incrit[2])))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 6: /* STATE 1 - Token.pml:83 - [ch[0]!tokgrant,0] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (q_full(now.ch[0]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[0]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[0], 0, 2, 0, 2);
		_m = 2; goto P999; /* 0 */
	case 7: /* STATE 2 - Token.pml:86 - [(run P(0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 3 - Token.pml:87 - [(run P(1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 4 - Token.pml:88 - [(run P(2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 6 - Token.pml:91 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 11: /* STATE 1 - Token.pml:15 - [incrit[id] = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.incrit[ Index(((int)((P0 *)this)->id), 3) ]);
		now.incrit[ Index(((P0 *)this)->id, 3) ] = 0;
#ifdef VAR_RANGES
		logval("incrit[P:id]", ((int)now.incrit[ Index(((int)((P0 *)this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 2 - Token.pml:17 - [holding = 0] (0:64:4 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->holding);
		((P0 *)this)->holding = 0;
#ifdef VAR_RANGES
		logval("P:holding", ((int)((P0 *)this)->holding));
#endif
		;
		/* merge: waiting = 0(64, 3, 64) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->waiting);
		((P0 *)this)->waiting = 0;
#ifdef VAR_RANGES
		logval("P:waiting", ((int)((P0 *)this)->waiting));
#endif
		;
		/* merge: requester = 0(64, 4, 64) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->requester);
		((P0 *)this)->requester = 0;
#ifdef VAR_RANGES
		logval("P:requester", ((int)((P0 *)this)->requester));
#endif
		;
		/* merge: pidx = 0(64, 5, 64) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = 0;
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 65, 64) */
		reached[0][65] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 13: /* STATE 6 - Token.pml:25 - [ch[id]??tokreq,requester] (0:0:2 - 1) */
		reached[0][6] = 1;
		if (q_len(now.ch[ Index(((int)((P0 *)this)->id), 3) ]) == 0) continue;

		XX=1;
		if (!(XX = Q_has(now.ch[ Index(((int)((P0 *)this)->id), 3) ], 1, 3, 0, 0))) continue;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = XX;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->requester);
		;
		((P0 *)this)->requester = qrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("P:requester", ((int)((P0 *)this)->requester));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ch[ Index(((int)((P0 *)this)->id), 3) ]);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->requester)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 14: /* STATE 7 - Token.pml:27 - [(holding)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!(((int)((P0 *)this)->holding)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: holding */  (trpt+1)->bup.oval = ((P0 *)this)->holding;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->holding = 0;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 8 - Token.pml:28 - [ch[requester]!tokgrant,id] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)this)->requester), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)this)->requester), 3) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->id)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)this)->requester), 3) ], 0, 2, ((int)((P0 *)this)->id), 2);
		_m = 2; goto P999; /* 0 */
	case 16: /* STATE 9 - Token.pml:29 - [holding = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->holding);
		((P0 *)this)->holding = 0;
#ifdef VAR_RANGES
		logval("P:holding", ((int)((P0 *)this)->holding));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 11 - Token.pml:31 - [ch[id]!tokreq,requester] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)this)->id), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)this)->id), 3) ]);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->requester)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)this)->id), 3) ], 0, 3, ((int)((P0 *)this)->requester), 2);
		_m = 2; goto P999; /* 0 */
	case 18: /* STATE 14 - Token.pml:35 - [ch[id]??tokgrant,_] (0:0:2 - 1) */
		reached[0][14] = 1;
		if (q_len(now.ch[ Index(((int)((P0 *)this)->id), 3) ]) == 0) continue;

		XX=1;
		if (!(XX = Q_has(now.ch[ Index(((int)((P0 *)this)->id), 3) ], 1, 2, 0, 0))) continue;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = XX;
		(trpt+1)->bup.ovals[1] = qrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, 0);
		;
		qrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ch[ Index(((int)((P0 *)this)->id), 3) ]);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 19: /* STATE 15 - Token.pml:36 - [holding = 1] (0:28:3 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->holding);
		((P0 *)this)->holding = 1;
#ifdef VAR_RANGES
		logval("P:holding", ((int)((P0 *)this)->holding));
#endif
		;
		/* merge: waiting = 0(28, 16, 28) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->waiting);
		((P0 *)this)->waiting = 0;
#ifdef VAR_RANGES
		logval("P:waiting", ((int)((P0 *)this)->waiting));
#endif
		;
		/* merge: pidx = 0(28, 17, 28) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = 0;
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 29, 28) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 20: /* STATE 18 - Token.pml:40 - [((pidx<=2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][18] = 1;
		if (!((((int)((P0 *)this)->pidx)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 19 - Token.pml:43 - [((pidx!=id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)((P0 *)this)->pidx)!=((int)((P0 *)this)->id))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 20 - Token.pml:44 - [ch[pidx]!tokrec,id] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->id)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ], 0, 1, ((int)((P0 *)this)->id), 2);
		_m = 2; goto P999; /* 0 */
	case 23: /* STATE 22 - Token.pml:45 - [(1)] (28:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(28, 24, 28) */
		reached[0][24] = 1;
		;
		/* merge: pidx = (pidx+1)(28, 25, 28) */
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = (((int)((P0 *)this)->pidx)+1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 29, 28) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 24: /* STATE 25 - Token.pml:40 - [pidx = (pidx+1)] (0:28:1 - 3) */
		IfNotBlocked
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = (((int)((P0 *)this)->pidx)+1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 29, 28) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 25: /* STATE 31 - Token.pml:49 - [critical = (critical+1)] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = ((int)critical);
		critical = (((int)critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 32 - Token.pml:50 - [incrit[id] = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.incrit[ Index(((int)((P0 *)this)->id), 3) ]);
		now.incrit[ Index(((P0 *)this)->id, 3) ] = 1;
#ifdef VAR_RANGES
		logval("incrit[P:id]", ((int)now.incrit[ Index(((int)((P0 *)this)->id), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 33 - Token.pml:51 - [critical = (critical-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][33] = 1;
		(trpt+1)->bup.oval = ((int)critical);
		critical = (((int)critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 34 - Token.pml:55 - [((!(holding)&&!(waiting)))] (46:0:2 - 1) */
		IfNotBlocked
		reached[0][34] = 1;
		if (!(( !(((int)((P0 *)this)->holding))&& !(((int)((P0 *)this)->waiting)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: waiting */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->waiting;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->waiting = 0;
		/* merge: pidx = 0(0, 35, 46) */
		reached[0][35] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = 0;
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 47, 46) */
		reached[0][47] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 29: /* STATE 36 - Token.pml:57 - [((pidx<=2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!((((int)((P0 *)this)->pidx)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 37 - Token.pml:60 - [((pidx!=id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		if (!((((int)((P0 *)this)->pidx)!=((int)((P0 *)this)->id))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 38 - Token.pml:61 - [ch[pidx]!tokreq,id] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][38] = 1;
		if (q_full(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ch[ Index(((int)((P0 *)this)->pidx), 3) ]);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->id)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ch[ Index(((int)((P0 *)this)->pidx), 3) ], 0, 3, ((int)((P0 *)this)->id), 2);
		_m = 2; goto P999; /* 0 */
	case 32: /* STATE 40 - Token.pml:62 - [(1)] (46:0:1 - 1) */
		IfNotBlocked
		reached[0][40] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(46, 42, 46) */
		reached[0][42] = 1;
		;
		/* merge: pidx = (pidx+1)(46, 43, 46) */
		reached[0][43] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = (((int)((P0 *)this)->pidx)+1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 47, 46) */
		reached[0][47] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 33: /* STATE 43 - Token.pml:57 - [pidx = (pidx+1)] (0:46:1 - 3) */
		IfNotBlocked
		reached[0][43] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = (((int)((P0 *)this)->pidx)+1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		/* merge: .(goto)(0, 47, 46) */
		reached[0][47] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 34: /* STATE 49 - Token.pml:65 - [waiting = 1] (0:64:1 - 3) */
		IfNotBlocked
		reached[0][49] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->waiting);
		((P0 *)this)->waiting = 1;
#ifdef VAR_RANGES
		logval("P:waiting", ((int)((P0 *)this)->waiting));
#endif
		;
		/* merge: .(goto)(0, 65, 64) */
		reached[0][65] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 35: /* STATE 50 - Token.pml:68 - [((len(ch[id])<2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][50] = 1;
		if (!((q_len(now.ch[ Index(((int)((P0 *)this)->id), 3) ])<2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 51 - Token.pml:70 - [pidx = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][51] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = 0;
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: /* STATE 52 - Token.pml:70 - [((pidx<=len(ch[id])))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][52] = 1;
		if (!((((int)((P0 *)this)->pidx)<=q_len(now.ch[ Index(((int)((P0 *)this)->id), 3) ]))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: pidx */  (trpt+1)->bup.oval = ((P0 *)this)->pidx;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->pidx = 0;
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 53 - Token.pml:73 - [ch[id]??tokrec,pidx] (0:0:3 - 1) */
		reached[0][53] = 1;
		if (q_len(now.ch[ Index(((int)((P0 *)this)->id), 3) ]) == 0) continue;

		XX=1;
		if (!(XX = Q_has(now.ch[ Index(((int)((P0 *)this)->id), 3) ], 1, 1, 0, 0))) continue;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = XX;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->pidx);
		;
		((P0 *)this)->pidx = qrecv(now.ch[ Index(((int)((P0 *)this)->id), 3) ], XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ch[ Index(((int)((P0 *)this)->id), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->pidx)); strcat(simvals, simtmp);		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: pidx */  (trpt+1)->bup.ovals[2] = ((P0 *)this)->pidx;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->pidx = 0;
		_m = 4; goto P999; /* 0 */
	case 39: /* STATE 57 - Token.pml:70 - [pidx = (pidx+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][57] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->pidx);
		((P0 *)this)->pidx = (((int)((P0 *)this)->pidx)+1);
#ifdef VAR_RANGES
		logval("P:pidx", ((int)((P0 *)this)->pidx));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 40: /* STATE 67 - Token.pml:78 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][67] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

