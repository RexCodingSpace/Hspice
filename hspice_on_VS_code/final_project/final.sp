*op amp*
.option method=gear
.option post 
.option runlvl=6
.op
.temp=25
.param w_i=4u
.param l_i=4u
.param w_1=1u
.param l_1=1u
.param w_2=1u
.param l_2=1u
.option captab=1

*circuit
.subckt opamp vdd 1 vin1 vin2 vout vss

 m1 3 vin1 2 2 p_18_mm w=w_1 l=l_1 m=100
 m2 4 vin2 2 2 p_18_mm w=w_1 l=l_1 m=100
 m3 3 3 vss vss n_18_mm w=w_2 l=l_2 m=2
 m4 4 3 vss vss n_18_mm w=w_2 l=l_2 m=2
 m5 vout 4 vss vss n_18_mm w=w_2 l=l_2 m=150
 m6 1 1 vdd vdd p_18_mm w=w_i l=l_i m=1
 m7 2 1 vdd vdd p_18_mm w=w_i l=l_i m=7
 m8 vout 1 vdd vdd p_18_mm w=w_i l=l_i m=356
 Cc 4 vout 6p
 CL vout vss 20p 

 .ends opamp

 X1 vdd 1 vin1 vin2 vout vss opamp
*source vin2(+)
 vdd vdd gnd 1.8
 vss vss gnd 0
 vin1 vin1 gnd 0.5
 vin2 vin2 gnd 0.5
 Ibias 1 gnd 1.5u
*simulation

 .tf V(vout) vin2
 .ac dec 1000 1 1G
 .probe vdb(vout) vp(vout)
*  .MEAS ac AvgPower AVG(power) FROM=1uS TO=39us
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.end
