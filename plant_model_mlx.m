%[text] # 
%%Inputs Section
permeateflow=10000; %m^3/day
seawatersalinity=35000; %mg/L
recovery=0.45; 
rejection=0.997;
temperature=298.15; %Degrees Kelvin
R=0.08314; %L*bar/mol*k
molarmassNaCl=58.44; %g/mol
nIons=2; %ions

%%Balance Section
feedflow=permeateflow/recovery;
brineflow=feedflow-permeateflow;
permeatesalinity=(1-rejection)*seawatersalinity;
brinesalinity=(feedflow*seawatersalinity-permeateflow*permeatesalinity)/(brineflow);
%%Salt Check
saltin=feedflow*seawatersalinity/1000000; %tonnes/day
saltout=(permeateflow*permeatesalinity+brineflow*brinesalinity)/1000000; %tonnes/day
fprintf("Salt in: %.1f tonnes/day\n",saltin); %[output:0307ac06]
fprintf("Salt out: %.1f tonnes/day\n",saltout); %[output:9765921e]
%%Osmotic Pressure
feedosmP=osmoticPressure(seawatersalinity,temperature);
brineosmP=osmoticPressure(brinesalinity,temperature) %[output:20c925e2]
fprintf("Feed Osmotic Pressure: %.1f bar\n",feedosmP) %[output:3d574cbc]
fprintf("Brine Osmotic Pressure: %.1f bar\n",brineosmP) %[output:8e55ea1c]
%%Results
feedflowCheck=22222;
fprintf("Feed Flow: %.1f,(check %.1f, diff %.1f)\n", feedflow,feedflowCheck,feedflow-feedflowCheck); %[output:55df01a4]
brineflowCheck=12222;
fprintf("Brine Flow: %.1f,(check %.1f, diff %.1f)\n", brineflow,brineflowCheck,brineflow-brineflowCheck); %[output:74116406]
permeatesalinityCheck=105;
fprintf("Permeate Salinity: %.1f,(check %.1f, diff %.1f)\n", permeatesalinity,permeatesalinityCheck,permeatesalinity-permeatesalinityCheck); %[output:47a21a75]
brinesalinityCheck=63550;
fprintf("Brine Salinity: %.1f,(check %.1f, diff %.1f)\n", brinesalinity, brinesalinityCheck, brinesalinity-brinesalinityCheck) %[output:83e4307b]
saltincheck=778 %[output:225c6fae]
fprintf("Salt In: %.1f, (check %.1f, diff %.1f)\n", saltin, saltincheck, saltin-saltincheck) %[output:5a5dfdc3]
saltoutcheck=778 %[output:4a6bf61f]
fprintf("Salt Out: %.1f, (check %.1f, diff %.1f)\n", saltout, saltoutcheck, saltout-saltoutcheck) %[output:21c70c22]
feedosmPCheck=29.7 %[output:3c9a040e]
fprintf("Feed Osmotic Pressure: %.1f, (check %.1f, diff %.1f)\n", feedosmP, feedosmPCheck, feedosmP-feedosmPCheck) %[output:6b6c873d]
brineosmPCheck=53.9 %[output:765c712a]
fprintf("Brine Osmotic Pressure: %.1f, (check %.1f, diff %.1f)\n", brineosmP, brineosmPCheck, brineosmP-brineosmPCheck) %[output:722b8021]
%%Max Recovery 
rMax60=maxRecovery(60,seawatersalinity,temperature) %[output:38cd3ef6]
fprintf("Max recovery at 60 bar: %.1f%%\n", rMax60*100); %[output:9f39587a]

function osmP=osmoticPressure(salinity,T)
n=2;
molarmassNaCl=58.44;
R=0.08314;
C=salinity ./ 1000 ./ molarmassNaCl;
osmP=n*C*R*T;
end 

function rMax60=maxRecovery(pressure,salinity,T)
n=2;
molarmassNaCl=58.44;
R=0.08314;
CMax=pressure ./ (n*R*T);
brineMax=CMax .* molarmassNaCl .* 1000;
rMax60=1-salinity ./ brineMax;
end




%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":10.8}
%---
%[output:0307ac06]
%   data: {"dataType":"text","outputData":{"text":"Salt in: 700.0 tonnes\/day\n","truncated":false}}
%---
%[output:9765921e]
%   data: {"dataType":"text","outputData":{"text":"Salt out: 700.0 tonnes\/day\n","truncated":false}}
%---
%[output:20c925e2]
%   data: {"dataType":"textualVariable","outputData":{"name":"brineosmP","value":"59.2346"}}
%---
%[output:3d574cbc]
%   data: {"dataType":"text","outputData":{"text":"Feed Osmotic Pressure: 29.7 bar\n","truncated":false}}
%---
%[output:8e55ea1c]
%   data: {"dataType":"text","outputData":{"text":"Brine Osmotic Pressure: 59.2 bar\n","truncated":false}}
%---
%[output:55df01a4]
%   data: {"dataType":"text","outputData":{"text":"Feed Flow: 20000.0,(check 20000.0, diff 0.0)\n","truncated":false}}
%---
%[output:74116406]
%   data: {"dataType":"text","outputData":{"text":"Brine Flow: 10000.0,(check 10000.0, diff 0.0)\n","truncated":false}}
%---
%[output:47a21a75]
%   data: {"dataType":"text","outputData":{"text":"Permeate Salinity: 175.0,(check 175.0, diff 0.0)\n","truncated":false}}
%---
%[output:83e4307b]
%   data: {"dataType":"text","outputData":{"text":"Brine Salinity: 69825.0,(check 69825.0, diff 0.0)\n","truncated":false}}
%---
%[output:225c6fae]
%   data: {"dataType":"textualVariable","outputData":{"name":"saltincheck","value":"700"}}
%---
%[output:5a5dfdc3]
%   data: {"dataType":"text","outputData":{"text":"Salt In: 700.0, (check 700.0, diff 0.0)\n","truncated":false}}
%---
%[output:4a6bf61f]
%   data: {"dataType":"textualVariable","outputData":{"name":"saltoutcheck","value":"700"}}
%---
%[output:21c70c22]
%   data: {"dataType":"text","outputData":{"text":"Salt Out: 700.0, (check 700.0, diff 0.0)\n","truncated":false}}
%---
%[output:3c9a040e]
%   data: {"dataType":"textualVariable","outputData":{"name":"feedosmPCheck","value":"29.7000"}}
%---
%[output:6b6c873d]
%   data: {"dataType":"text","outputData":{"text":"Feed Osmotic Pressure: 29.7, (check 29.7, diff -0.0)\n","truncated":false}}
%---
%[output:765c712a]
%   data: {"dataType":"textualVariable","outputData":{"name":"brineosmPCheck","value":"59.2000"}}
%---
%[output:722b8021]
%   data: {"dataType":"text","outputData":{"text":"Brine Osmotic Pressure: 59.2, (check 59.2, diff 0.0)\n","truncated":false}}
%---
%[output:38cd3ef6]
%   data: {"dataType":"textualVariable","outputData":{"name":"rMax60","value":"0.5051"}}
%---
%[output:9f39587a]
%   data: {"dataType":"text","outputData":{"text":"Max recovery at 60 bar: 50.5%\n","truncated":false}}
%---
