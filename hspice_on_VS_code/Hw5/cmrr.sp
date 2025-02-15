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
vvin1 vin1 gnd 800m ac 1
vvin2 vin2 gnd 800m 
i1 vdd vb2 50u
i2 vb3 gnd 50u
i3 vb4 gnd 50u
*component
CL1 vout2 gnd 6p
CL2 vout1 gnd 6p
*circuit
.param ls=0.48u
mss 1 vb1 gnd gnd n_18_mm w=160u l=8u AS="ls*160u" AD="ls*160u" PS="2*ls+160u" PD="2*ls+160u"

m1 2 vin1 1 gnd n_18_mm w=50u l=4u AS="ls*50u" AD="ls*50u" PS="2*ls+50u" PD="2*ls+50u"
m2 3 vin2 1 gnd n_18_mm w=50u l=4u AS="ls*50u" AD="ls*50u" PS="2*ls+50u" PD="2*ls+50u"
m3 vout2 vb2 2 gnd n_18_mm w=65u l=4u AS="ls*65u" AD="ls*65u" PS="2*ls+65u" PD="2*ls+65u"
m4 vout1 vb2 3 gnd n_18_mm w=65u l=4u AS="ls*65u" AD="ls*65u" PS="2*ls+65u" PD="2*ls+65u"
m5 vout2 vb3 4 vdd p_18_mm w=50u l=4u AS="ls*50u" AD="ls*50u" PS="2*ls+50u" PD="2*ls+50u"
m6 vout1 vb3 5 vdd p_18_mm w=50u l=4u AS="ls*50u" AD="ls*50u" PS="2*ls+50u" PD="2*ls+50u"
m7 4 vb4 vdd vdd p_18_mm w=90u l=4u AS="ls*90u" AD="ls*90u" PS="2*ls+90u" PD="2*ls+90u"
m8 5 vb4 vdd vdd p_18_mm w=90u l=4u AS="ls*90u" AD="ls*90u" PS="2*ls+90u" PD="2*ls+90u"

m9 vb1 vb1 gnd gnd n_18_mm w=8u l=8u AS="ls*8u" AD="ls*8u" PS="2*ls+8u" PD="2*ls+8u"
m10 12 12 gnd gnd n_18_mm w=8u l=8u AS="ls*8u" AD="ls*8u" PS="2*ls+8u" PD="2*ls+8u"

m11 12 vout2 9 9 p_18_mm w=5u l=1u AS="ls*5u" AD="ls*5u" PS="2*ls+5u" PD="2*ls+5u"
m12 vb1 vcmo 9 9 p_18_mm w=5u l=1u AS="ls*5u" AD="ls*5u" PS="2*ls+5u" PD="2*ls+5u"
m13 vb1 vcmo 10 10 p_18_mm w=5u l=1u AS="ls*5u" AD="ls*5u" PS="2*ls+5u" PD="2*ls+5u"
m14 12 vout1 10 10 p_18_mm w=5u l=1u AS="ls*5u" AD="ls*5u" PS="2*ls+5u" PD="2*ls+5u"

m15 9 vb4 vdd vdd p_18_mm w=9u l=4u AS="ls*9u" AD="ls*9u" PS="2*ls+9u" PD="2*ls+9u"
m16 10 vb4 vdd vdd p_18_mm w=9u l=4u AS="ls*9u" AD="ls*9u" PS="2*ls+9u" PD="2*ls+9u"

mb1 vb2 vb2 gnd gnd n_18_mm w=2.9u l=4u AS="ls*2.9u" AD="ls*2.9u" PS="2*ls+2.9u" PD="2*ls+2.9u"
mb2 vb3 vb3 vdd vdd p_18_mm w=14u l=4u AS="ls*14u" AD="ls*14u" PS="2*ls+14u" PD="2*ls+14u"
mb3 13 vb4 vdd vdd p_18_mm w=90u l=4u AS="ls*90u" AD="ls*90u" PS="2*ls+90u" PD="2*ls+90u"
mb4 vb4 vb3 13 vdd p_18_mm w=50u l=4u AS="ls*50u" AD="ls*50u" PS="2*ls+50u" PD="2*ls+50u"

*simulation 
.ac dec 1000 1 100X

.probe ac v(vout1,vout2)
.probe ac vdb(vout1,vout2)
.probe ac vp(vout1,vout2)
.probe ac "(v(vout1,vout2))/(v(vin1,vin2))"
.probe ac vdb(vdd)
.probe ac "v(vout1,vout2)/v(vdd)"
.probe ac "vdb(vout1,vout2)-vdb(vdd)"

.meas ac gainmax max vdb(vout1,vout2)
.meas ac GBW when Vdb(vout1,vout2)=0
.meas ac PM find "180+vp(vout1,vout2)" when vdb(vout1,vout2)=0
.meas ac f3db when vdb(vout1,vout2)="gainmax-3"
.meas ac avgpower avg(power) from=1u to=39u

*"0|vdb(vout1,vout2)"-"5|vdb(vout1,vout2)"這個扣
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
.alter
vvin2 vin2 gnd 800m ac 1
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