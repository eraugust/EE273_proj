*************************************************************************
*************************************************************************
*									*
*			Simplistic Connector Model			*
*									*
*				  4x8 Mid				*
*									*
*************************************************************************
*************************************************************************
.SUBCKT (conn_4x8mid) ref inp inn outp outn
* Midplane Side Terminations *
* R1 1 0 rref
* R3 3 0 rref
R5 5 0 rref
R7 7 0 rref
R9 9 0 rref
R11 11 0 rref
R13 13 0 rref
R15 15 0 rref
R17 17 0 rref
R19 19 0 rref
R21 21 0 rref
R23 23 0 rref

* Connector *
S1 inp outp inn outn 5 6 7 8 9 10 11 12
+ 13 14 15 16 17 18 19 20 21 22 23 24 MNAME=s_model

* Daughter Card Side Terminations *
*R2 2 0 rref
*R4 4 0 rref
R6 6 0 rref
R8 8 0 rref
R10 10 0 rref
R12 12 0 rref
R14 14 0 rref
R16 16 0 rref
R18 18 0 rref
R20 20 0 rref
R22 22 0 rref
R24 24 0 rref

* Connector S-parameter Model *
.MODEL s_model S TSTONEFILE=./XCedePlus_4pr_97ohm_1p85mm_With_Extra_GND_2mm_Sig_3mm_GND_Wipe.s32p'
.ENDS (conn_4x8mid) *
*************************************************************************
*************************************************************************
