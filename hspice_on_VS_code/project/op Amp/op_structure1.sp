*op amp*
.option method=gear
.option post 
.option runlvl=6
.op
.temp=25
.param w_1=10u
.param l_1=1u

*circuit
 m1 3 vin1 2 2 p_33 w=w_1 l=l_1 m=36
 m2 4 vin2 2 2 p_33 w=w_1 l=l_1 m=36
 m3 3 3 gnd gnd n_33 w=w_1 l=l_1 m=6
 m4 4 3 gnd gnd n_33 w=w_1 l=l_1 m=6
 m5 vout 4 gnd gnd n_33 w=w_1 l=l_1 m=18
 m6 1 1 vdd vdd p_33 w=w_1 l=l_1 m=3
 m7 2 1 vdd vdd p_33 w=w_1 l=l_1 m=30
 m8 vout 1 vdd vdd p_33 w=w_1 l=l_1 m=45
 Cc 4 vout 0.3p
 CL vout gnd 1p 
 RL vout gnd 400k
*source
 vdd vdd gnd 3.3
 vss vss gnd 0
 vin1 vin1 gnd sin(2 0.001 100k) ac 1 180
 vin2 vin2 gnd sin(2 -0.001 100k) ac 1 
 Ibias 1 gnd 20u
*simulation
.tf V(vout) vin2
.probe  I(m6) I(m3) I(m4) I(m7) V(1)
.tran 10n 1m
 .ac dec 1000 1 2000X 
 .probe ac vdb(vout) vp(vout)
 .MEAS TRAN AvgPower AVG(power) FROM=1uS TO=39us
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
.end
