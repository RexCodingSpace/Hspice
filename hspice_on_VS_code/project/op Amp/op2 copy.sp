*op amp*
.option method=gear
.option post 
.option runlvl=6
.op
.temp=25
.param w_1=10u
.param l_1=1u
.option captab=1
*circuit
 m1 3 vin1 2 2 p_33 w=w_1 l=l_1 m=1
 m2 4 vin2 2 2 p_33 w=w_1 l=l_1 m=1
 m3 3 3 gnd gnd n_33 w=w_1 l=l_1 m=1
 m4 4 3 gnd gnd n_33 w=w_1 l=l_1 m=1
 m5 vout 4 gnd gnd n_33 w=w_1 l=l_1 m=2
 m6 1 1 vdd vdd p_33 w=w_1 l=l_1 m=1
 m7 2 1 vdd vdd p_33 w=w_1 l=l_1 m=1
 m8 vout 1 vdd vdd p_33 w=w_1 l=l_1 m=1
 Cc 4 vout 0.3p
 CL vout gnd 1p 
 RL vout gnd 400k
*source
 vdd vdd gnd 3.3
 vss vss gnd 0
 vin1 vin1 gnd sin(2 0.01 100k) 
 vin2 vin2 gnd sin(2 -0.01 100k) ac 1
 Ibias 1 gnd 20u
*simulation
.tf V(vout) vin2
.probe  I(m6) I(m3) I(m4) I(m7) V(1)
 .ac dec 1000 1 1X 
 .tran 10n 1m
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
.end
