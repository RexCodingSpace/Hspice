Hw4_1
.option method=gear
.option post 
.option runlvl=6
.op
.temp=25
*source
vdd vdd gnd 1.8
*component
r1 4 5 10k
r2 vref 7 105k
*circuit
m1 2 2 3 gnd n_18_mm w=5u l=5u
m2 1 2 4 gnd n_18_mm w=5u l=5u
m3 2 1 vdd vdd p_18_mm w=10u l=5u
m4 1 1 vdd vdd p_18_mm w=10u l=5u
m5 vref 1 vdd vdd p_18_mm w=10u l=5u
q1 gnd gnd 3 pnp_v50x50_mm m=10
q2 gnd gnd 5 pnp_v50x50_mm m=80 
q3 gnd gnd 7 pnp_v50x50_mm m=10
*simulation 
.dc temp -20 120 1
*library
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_bjt_v121.lib" tt_bip
.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ff
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_bjt_v121.lib" ff_bip
.alter
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" ss
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_bjt_v121.lib" ss_bip
.end