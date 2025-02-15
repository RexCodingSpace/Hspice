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


*circuit 調gm不調ROUT
.subckt opamp vdd 1 ac_1 vin1 vin2 vout vss

 m1 3 vin1 2 2 p_33 w=w_1 l=l_1 m=8
 m2 4 vin2 2 2 p_33 w=w_1 l=l_1 m=8
 m3 3 3 vss vss n_33 w=w_2 l=l_2 m=3
 m4 4 3 vss vss n_33 w=w_2 l=l_2 m=3
 m5 vout 4 vss vss n_33 w=w_2 l=l_2 m=15
 m6 1 1 vdd vdd p_33 w=w_i l=l_i m=1
 m7 2 1 vdd vdd p_33 w=w_i l=l_i m=9
 m8 vout 1 vdd vdd p_33 w=w_i l=l_i m=22.5
 Cc 4 5 0.3p
 CL vout vss 1p 
 RZ 5 vout 13k
 RL vout vss 400k
 L1 vout vin1 1G
 C1 vin1 ac_1 1G

 .ends opamp

 X1 vdd 1 ac_1 vin1 vin2 vout vss opamp
*source
 vdd vdd gnd 3.3 
 vss vss gnd 0
 vin1 vin1 gnd 2 ac 1 180
 vin2 vin2 gnd 2 ac 1 
 Ibias 1 gnd 1.5u
 Vac1 ac_1 gnd ac 1 
*simulation

.tf V(vout) vin2
.probe  I(m6) I(m3) I(m4) I(m7) V(1)

 .ac dec 1000 1 1G
 .probe vdb(vout) vp(vout)
 .MEAS ac AvgPower AVG(power) FROM=1uS TO=39us
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" ff
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" ss
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" fs
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" sf
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
vin1 vin1 gnd 2 ac 1 
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" ff
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" ss
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" fs
.alter
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" sf
.end
