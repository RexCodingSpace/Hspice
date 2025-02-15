Text
*列出MOS的腳位置跟W,L等等特性 
.option list
*印operation point 資訊 1/gds=ro
.op
*.option post 必要
.option post
*.option probe只列印probe, 否則全印加上probe
.option probe
.temp 25
*source ac 1 is sweep value
vdd vdd gnd dc 3.3
vin vin gnd ac 1 sin(1.65 100m 1k)
*component
rs vin 1 1k 
c1 1 2 100u
r2 vdd 2 40k
r1 2 gnd 25k 
r3 vout gnd 600
*circuit mos D G S B 絕對不能多打，程式會誤判並且不會跟你說
mm vdd 2 vout gnd n_18_mm w=1.8u l=0.18u 
*simulation .print .probe 默認tran 狀態 若要其他狀態，要加上 ac dc 之類的
* .print 會在lis中印出來全部
.tran 10n 1m
.probe I(mm) v(1)
.probe ac I(mm) I(rs) I(r3)
.print lv1(mm) lv2(mm) 
.print ac lv1(mm) 
.ac dec 10 100 1G
*library
.lib "/RAID2/COURSE/AICIntro/AICIntro071/U18_model/U18_Spice_model/mm180_reg18_v124.lib" tt
.lib "C:\Users\User\OneDrive\桌面\Hspice on VS  code\U18_model"tt
.end