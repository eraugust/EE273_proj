* Test of Xcede+ 4x8 Midplane Connector s32p Model *

*************************************************************************
*                                                                       *
*			Parameter Definitions				*
*                                                                       *
*************************************************************************
 .PARAM vstep	= 2			* Driver diff pp drive voltage, volts
 .PARAM trise	= 25p			* Driver rise time, seconds
 .PARAM tfall	= 25p			* Driver fall time, seconds

 .PARAM rref	= 50			* Receiver input resistance, ohms

 .PARAM simtime	= 3n			* Use/adjust for and eye diagram
 .PARAM intv	= 1p			* Reporting interval, seconds.

*************************************************************************
*                                                                       *
*				Main Circuit				*
*                                                                       *
*************************************************************************
 * Positive TDR Input *
 V1p p   gnd  PULSE 0v 2v 0 trise trise 0.5 1
 Rsp p   inp  rref 
 T1p inp 0    1 0 Z0=rref TD=0.5n
 
 * Negative TDR Input *
 V1n n   gnd  PULSE 0v -2v 0 trise trise 0.5 1
 Rsn n   inn  rref 
 T1n inn 0    3 0 Z0=rref TD=0.5n
 
 * Positive TDT Output *
 T2p 2 0  outp 0 Z0=rref TD=0.5n
 Rtp outp 0      rref

 * Negative TDT Output *
 T2n 4 0 outn 0 Z0=rref TD=0.5n
 Rtn outn     0 rref

* Daughter Card Side Terminations *
*R1    1 0  rref
*R3    3 0  rref
 R5    5 0  rref
 R7    7 0  rref
 R9    9 0  rref
 R11  11 0  rref
 R13  13 0  rref
 R15  15 0  rref
 R17  17 0  rref
 R19  19 0  rref
 R21  21 0  rref
 R23  23 0  rref
 R25  25 0  rref
 R27  27 0  rref
 R29  29 0  rref
 R31  31 0  rref

* Connector *
 S1   1   2   3   4   5   6   7   8   9   10   11   12   13   14   15   16
+    17  18  19  20  21  22  23  24  25   26   27   28   29   30   31   32  MNAME=s_model

* Backplane Side Terminations *
*R2    2 0  rref
*R4    4 0  rref
 R6    6 0  rref
 R8    8 0  rref
 R10  10 0  rref
 R12  12 0  rref
 R14  14 0  rref
 R16  16 0  rref
 R18  18 0  rref
 R20  20 0  rref
 R22  22 0  rref
 R24  24 0  rref
 R26  26 0  rref
 R28  28 0  rref
 R30  30 0  rref
 R32  32 0  rref

* Connector S-parameter Model *
 .MODEL s_model S TSTONEFILE='./XCedePlus_4pr_97ohm_1p85mm_With_Extra_GND_2mm_Sig_3mm_GND_Wipe.s32p'


*************************************************************************
*                                                                       *
*		    Simulation Controls and Alters			*
*                                                                       *
*************************************************************************
 .OPTION post=1 accurate
 .PROBE TRAN  impedd=PAR('2*rref*V(inp,inn)/(V(p,n)-V(inp,inn))')
 .TRAN intv simtime
 .END
