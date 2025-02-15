*****************
.option method=gear
.option post acct
.option runlvl=6
.temp=25
.option accurate
.option post 
.op
*source
vvdd vdd gnd 1.8
vvcmo vcmo gnd 900m
vvinplus vinplus gnd 800m ac 1
vvinminus vinminus gnd 800m ac 1 180
i1 vdd vb2 50u
i2 vb3 gnd 50u
i3 vb4 gnd 50u
*component
CL1 voutminus gnd 6p
CL2 voutplus gnd 6p
*circuit
mss 1 vb1 gnd gnd n_18_mm w=160u l=8u

m1 2 vinplus 1 gnd n_18_mm w=50u l=4u
m2 3 vinminus 1 gnd n_18_mm w=50u l=4u
m3 voutminus vb2 2 gnd n_18_mm w=65u l=4u
m4 voutplus vb2 3 gnd n_18_mm w=65u l=4u
m5 voutminus vb3 4 vdd p_18_mm w=50u l=4u
m6 voutplus vb3 5 vdd p_18_mm w=50u l=4u
m7 4 vb4 vdd vdd p_18_mm w=90u l=4u
m8 5 vb4 vdd vdd p_18_mm w=90u l=4u

m9 vb1 vb1 gnd gnd n_18_mm w=8u l=8u
m10 12 12 gnd gnd n_18_mm w=8u l=8u

m11 12 voutminus 9 9 p_18_mm w=5u l=1u
m12 vb1 vcmo 9 9 p_18_mm w=5u l=1u
m13 vb1 vcmo 10 10 p_18_mm w=5u l=1u
m14 12 voutplus 10 10 p_18_mm w=5u l=1u

m15 9 vb4 vdd vdd p_18_mm w=9u l=4u
m16 10 vb4 vdd vdd p_18_mm w=9u l=4u

mb1 vb2 vb2 gnd gnd n_18_mm w=2.9u l=4u
mb2 vb3 vb3 vdd vdd p_18_mm w=14u l=4u
mb3 13 vb4 vdd vdd p_18_mm w=90u l=4u
mb4 vb4 vb3 13 vdd p_18_mm w=50u l=4u

*simulation 
.ac dec 1000 1 100X

.probe ac v(voutplus)
.probe ac vdb(voutplus)
.probe ac vp(voutplus)

.meas ac gainmax max vdb(voutplus)
.meas ac GBW when Vdb(voutplus)=0
.meas ac PM find "180+vp(voutplus)" when vdb(voutplus)=0
.meas ac f3db when vdb(voutplus)="gainmax-3"
.meas ac avgpower avg(power) from=1u to=39u
*library
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" tt
.alter 
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" ff
.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" ss
.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" fnsp
.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" snfp
.end