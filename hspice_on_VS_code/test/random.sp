random coding 
.option post 
.option probe
*source
vdd vdd gnd 3
vss vss gnd 0
vin vin gnd sin(0 10m 20k)
*component 
r1 vdd 1 10k
r2 1 vss 20k
.probe V(1) V(vdd) V(r1)
.tran 10n 1m
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.end