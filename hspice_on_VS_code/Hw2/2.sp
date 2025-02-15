Homework2_2 compare fig 1. and fig 2.
.option post
* .option probe=1
.op
.temp 25
*circuit 
mp vout vout vdd vdd p_18_mm w=1.5u l=1u
mn vout vin gnd gnd n_18_mm w=1.2u l=0.18u
*source 
vdd vdd gnd 1.8
vin vin gnd sin(0.6 0.01 100k)
*simulation 
.tran 10n 0.1m
.tf v(vout) vin 
.probe i(mn)
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt

.alter 
mn vout vin gnd gnd n_18_mm w=3.6u l=0.54u

.end