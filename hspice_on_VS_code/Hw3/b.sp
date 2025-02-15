Hw3
.option post 
.option probe
.temp 25
*source
vdd vdd gnd 1.8
vin vin gnd 0.3 ac 1
vb vb gnd 0.9
*circuit
mn vout vb 1 gnd n_18_mm w=11u l=1.1u
rs 1 vin 10k
cout vout gnd 0.02p 
rd vdd vout 20k
*sim
.meas AC gainmax max vdb(vout) 
.meas AC f3db WHEN vdb(vout)="gainmax-3"
.tf V(vout) vin 
.tran 10n 1m
.ac dec 100 1 2G

.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.end