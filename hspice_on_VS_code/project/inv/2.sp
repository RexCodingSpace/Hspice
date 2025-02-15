*INV using subcirucit*
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
*匯入子電路
*INV subcircuit*
.subckt Inverter vdd vin vout vss
mn vout vin vss vss n_18 w=1.8u l=0.18u
mp vout vin vdd vdd p_18 w=1.8u l=0.18u
.ends Inverter                                                                                           
*模擬程式
.option post 
.option method=gear
.option runlvl=6
.temp=25
.op
*circuit
x1 vdd vin vout vss Inverter
*source 
vdd vdd gnd 1.8
vss vss gnd 0
vin vin gnd 0.9 
*simulation
.dc vin 0 1.8 0.1
.end