*Slew rate*
.option method=gear
.option post 
.option runlvl=6
.op
.temp=25
.param w_i=4u
.param l_i=4u
.param w_1=0.35u
.param l_1=0.35u
.param w_2=0.35u
.param l_2=0.35u
.option captab=1

*circuit 
.subckt opamp vdd 1 vin1 vin2 vout vss

 m1 3 vin1 2 2 p_18_mm w=w_1 l=l_1 m=65
 m2 4 vin2 2 2 p_18_mm w=w_1 l=l_1 m=65
 m3 3 3 vss vss n_18_mm w=w_2 l=l_2 m=4
 m4 4 3 vss vss n_18_mm w=w_2 l=l_2 m=4
 m5 vout 4 vss vss n_18_mm w=w_2 l=l_2 m=160
 m6 1 1 vdd vdd p_18_mm w=w_i l=l_i m=3
 m7 2 1 vdd vdd p_18_mm w=w_i l=l_i m=30
 m8 vout 1 vdd vdd p_18_mm w=w_i l=l_i m=600
 Cc 4 vout 8p
 CL vout vss 20p 

 .ends opamp

 X1 vdd 1 vin1 vin2 vout vss opamp
*source vin2(+) vov太小，加大ID and W/L
 vdd vdd gnd 1.8
 vss vss gnd 0
 vin1 vin1 gnd 0.8 
 vin2 vin2 gnd pulse(0V 1.8 2us 1ps 1ps 10us 20us)
 Ibias 1 gnd 4.5u
*simulation

 .tran 0.1n 30us
 .probe v(vout1,vout2)

 
.meas ac gainmax max vdb(vout)
.meas ac GBW when Vdb(vout)=0
.meas ac PM find "180+vp(vout)" when vdb(vout)=0

*  .MEAS ac AvgPower AVG(power) FROM=1uS TO=39us
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.end
