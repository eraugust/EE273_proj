* CTLE TEST *
.PARAM az1 = 1.8g
.PARAM ap1 = 5.35g
.PARAM ap2 = 10g
.INCLUDE './rx_eq_diff.inc'
Vip inp 0 AC 0.5
Vin inn 0 AC -0.5
Xctle inp inn outp outn rx_eq_diff az1=az1 ap1=ap1 ap2=ap2
.OPTIONS post ACCURATE
.ac dec 1000 1k 20G

.END
