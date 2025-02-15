Hspice_HW5_109511308

.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" tt


.Global gnd 
.Global vdd 

Vdd vdd gnd 1.8 
I1 vdd vb2 50u 
I2 vb3 gnd 50u 
I3 vb4 gnd 50u

$BIAS STAGE
Mb1 vb2 vb2 gnd gnd n_18_mm w=2.9u l=4u  
Mb2 vb3 vb3 vdd vdd p_18_mm w=14u l=4u 
Mb3 001 vb4 vdd vdd p_18_mm w=90u l=4u 
Mb4 vb4 vb3 001 vdd p_18_mm w=50u l=4u  


vcmo cmo gnd 0.9 
vin1 vi1 gnd 0.8 ac 1
vin2 vi2 gnd 0.8 


$TELESCOPIC OPAMP STAGE

Mss vss vb1 gnd gnd n_18_mm w=160u l=8u  
M01 111 vi1 vss gnd n_18_mm w=50u l=4u  
M02 222 vi2 vss gnd n_18_mm w=50u l=4u  
M03 vout2 vb2 111 gnd n_18_mm w=65u l=4u  
M04 vout1 vb2 222 gnd n_18_mm w=65u l=4u  
M05 vout2 vb3 555 vdd p_18_mm w=50u l=4u  
M06 vout1 vb3 666 vdd p_18_mm w=50u l=4u  
M07 555 vb4 vdd vdd p_18_mm w=90u l=4u  
M08 666 vb4 vdd vdd p_18_mm w=90u l=4u 

CL1 vout2 gnd 6p 
CL2 vout1 gnd 6p 


*CMFB STAGE
M09 vb1 vb1 gnd gnd n_18_mm w=8u l=8u  
M10 vb0 vb0 gnd gnd n_18_mm w=8u l=8u 
M11 vb0 vout2 sll sll p_18_mm w=5u l=1u 
M12 vb1 cmo sll sll p_18_mm w=5u l=1u 
M13 vb1 cmo srr srr p_18_mm w=5u l=1u 
M14 vb0 vout1 srr srr p_18_mm w=5u l=1u 
M15 sll vb4 vdd vdd p_18_mm w=9u l=4u 
M16 srr vb4 vdd vdd p_18_mm w=9u l=4u 

*OPTIONS

.option post=1 
.option accurate=1 
.option probe=1 
.op
.temp=25 
.ac dec 1000 1 100X
*.tran 10n 100u
.probe ac v(vout1,vout2) 
.probe ac vdb(vout1,vout2)
.probe ac vp (vout1,vout2) 

*MEASURE
.measure ac dcgain max vdb(vout1,vout2) 
.measure ac GBW when Vdb(Vout1,vout2)=0
.measure ac PM find "180+vp(vout1,vout2)" when vdb(vout1,vout2)=0
.measure ac f3db when vdb(vout1,vout2)="dcgain-3"

.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" ff

.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" ss

.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" fnsp

.alter
.lib "C:\for_hspice_code\project_file\hspice_on_VS_code\U18_model\U18_Spice_model\mm180_reg18_v124.lib" snfp

.end