%create table
clear all
clc
for j = 1:4
    k = j;
newfl=sprintf('complianceAdult0%i.mat',j);
name{k} = sprintf('Adult0%i',j);
load(newfl);
R2new(k) = R2;
rnew(k) = r;
unew(k) = u;
deltaV(k) = Volume(length(Volume))-Volume(1);
deltaP(k) = Pressure(length(Pressure))-Pressure(1);
compliance(k) = deltaV(k)/deltaP(k);
v0(k) = Volume(1);
[toe tran Toeslope Highslope] = regionfind(u,r)
Toe(k) = 1/2*(toe.^2-1);
Tran(k) = 1/2*(tran.^2-1);
toeslope(k) = Toeslope;
highslope(k) = Highslope;
end
for j = 1:5
    k = j+4
newfl=sprintf('complianceAged0%i.mat',j);
name{k} = sprintf('Aged0%i',j);
load(newfl);
R2new(k) = R2;
rnew(k) = r;
unew(k) = u;
deltaV(k) = Volume(length(Volume))-Volume(1);
deltaP(k) = Pressure(length(Pressure))-Pressure(1);
compliance(k) = deltaV(k)/deltaP(k);
v0(k) = Volume(1);
[toe tran Toeslope Highslope] = regionfind(u,r)
Toe(k) = 1/2*(toe.^2-1);
Tran(k) = 1/2*(tran.^2-1);
toeslope(k) = Toeslope;
highslope(k) = Highslope;
end
r = rnew';
R2 = R2new';
mu = unew';
deltaV = deltaV';
deltaP = deltaP';
compliance = compliance';
v0 = v0';
Toe = Toe';
Tran = Tran';
toeslope = toeslope';
highslope = highslope';
T = table(r,mu,R2,deltaV,deltaP,Toe,Tran,toeslope,highslope,v0,compliance,'RowNames',name)
filename = 'bladderdata.xlsx';
writetable(T,filename,'Sheet',1,'Range','D1')