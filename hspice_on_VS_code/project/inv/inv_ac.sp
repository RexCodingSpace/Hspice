*INV*
.option method=gear
.option post
.option runlvl=6
.option acct
.op
.temp=25
m1 vout vin vdd vdd p_18 w=2u l=0.18u 
m2 vout vin vss vss n_18 w=1u l=0.18u 
vdd vdd vss 1.8
vss vss 0 0
vin vin vss 0.9 ac 1
.ac dec 1000 10 1G 
.lib "C:\For_Hspice_code\Project_file\Hspice_on_VS_code\cic018.l" tt
.end
