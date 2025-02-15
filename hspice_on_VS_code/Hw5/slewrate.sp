*****************
.option method=gear
.option post acct
.option runlvl=6
.temp 25
.option accurate
.option post 
.op

*source
vvdd vdd gnd 1.8 
vvcmo vcmo gnd 900m
vvin1 vin1 gnd pulse(0V 1.8 2us 1ps 1ps 10us 20us)
vvin2 vin2 gnd 800m 
i1 vdd vb2 50u
i2 vb3 gnd 50u
i3 vb4 gnd 50u
*component
CL1 vout2 gnd 6p
CL2 vout1 gnd 6p
*circuit vin1(+) vin2(-) 
mss 1 vb1 gnd gnd n_18_mm w=160u l=8u

m1 2 vin1 1 gnd n_18_mm w=50u l=4u
m2 3 vin2 1 gnd n_18_mm w=50u l=4u
m3 vout2 vb2 2 gnd n_18_mm w=65u l=4u
m4 vout1 vb2 3 gnd n_18_mm w=65u l=4u
m5 vout2 vb3 4 vdd p_18_mm w=50u l=4u
m6 vout1 vb3 5 vdd p_18_mm w=50u l=4u
m7 4 vb4 vdd vdd p_18_mm w=90u l=4u
m8 5 vb4 vdd vdd p_18_mm w=90u l=4u

m9 vb1 vb1 gnd gnd n_18_mm w=8u l=8u
m10 12 12 gnd gnd n_18_mm w=8u l=8u

m11 12 vout2 9 9 p_18_mm w=5u l=1u
m12 vb1 vcmo 9 9 p_18_mm w=5u l=1u
m13 vb1 vcmo 10 10 p_18_mm w=5u l=1u
m14 12 vout1 10 10 p_18_mm w=5u l=1u

m15 9 vb4 vdd vdd p_18_mm w=9u l=4u
m16 10 vb4 vdd vdd p_18_mm w=9u l=4u

mb1 vb2 vb2 gnd gnd n_18_mm w=2.9u l=4u
mb2 vb3 vb3 vdd vdd p_18_mm w=14u l=4u
mb3 13 vb4 vdd vdd p_18_mm w=90u l=4u
mb4 vb4 vb3 13 vdd p_18_mm w=50u l=4u

*simulation 
.tran 0.1n 30us

.probe v(vout1,vout2)

*library

.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.alter 
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ff
.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ss
.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" fnsp
.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" snfp
.end