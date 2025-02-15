Hw2_1
.option probe=1
.temp 25
*source
Vdd vdd gnd 1.8
vin vin gnd sin(0.6 0.01 100k)
*ckt 
mn vout vin gnd gnd n_18_mm w=1.2u l=0.18u
mp vout vout vdd vdd p_18_mm w=1.5u l=1u

*sim
.print LV1(mn)
.probe i(mn)
.tran 10n 1m
.tf V(vout) vin
.print cin=cap(vin) cout= cap(vout)

.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt

.alter
mn vout vin gnd gnd n_18_mm w=3.6u l=0.54u

.alter 
mn vout vin gnd gnd n_18_mm w=1.2u l=0.18u
.temp 75

.alter 
.temp 25
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ff

.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ss

.alter 
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" fnsp

.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" snfp

.end
