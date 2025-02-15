*INV*
.option method=gear
.option post acct
.option runlvl=6
.op
.temp=25
*circuit
m1 vout vin vdd vdd p_18 w=2u l=0.18u 
m2 vout vin vss vss n_18 w=1u l=0.18u 
*source
vdd vdd vss 1.8
vss vss 0 0
vin vin vss 0.9
*simulation
.dc vin 0 1.8 0.1
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
.end
