% Temp controller variables
load calibration_matrix

VC = [5.0 -5.0 4.7 -4.7 1.0]; %HE HF KE KF KH
M = ones(100,1) * -1; %initial values of v_hist in function get_V
% HE hip extension voltage
% HF hip flextion voltage
% KE knee extension voltage
% KF knee flexion voltage
% KH knee holding voltage during stance

% Ground contact model
GC.M_RB = smiData.Solid(1).mass+2*smiData.Solid(4).mass+2*smiData.Solid(3).mass+2*smiData.Solid(2).mass;
GC.k_gx = 10*GC.M_RB/0.01;
GC.k_gy = 150*GC.M_RB/0.01;

% Motor variables
%*************************************************************
%HiTec HS-82MG - 12133
%*************************************************************
motorKnee.Ra = motorKnee.Um/motorKnee.Is;              %[Ohm] Ankerwiderstand
motorKnee.Jm = 1/2*motorKnee.m*motorKnee.r^2;          %[kg*m²] Trägheitsmoment des Motors
% motorKnee.inductance = motorKnee.Ra*(134*1e-6);

motorKnee.k = (motorKnee.Um-motorKnee.I0*motorKnee.Ra)*60/(2*pi*motorKnee.n0);   %[Vs = Nm/A] -> Motorkonstante

% motorKnee.Mrm = motorKnee.k*motorKnee.I0;              %[N.m] -> Reibmoment Motor
% motorKnee.Mra = motorKnee.k*motorKnee.Ia;              %[N.m] -> Haftreibmonent
motorKnee.na = (motorKnee.Us-motorKnee.I0*motorKnee.Ra)/motorKnee.k;     %[rad/s] Anlaufdrehzahl

motorKnee.i = 1/185.8428;                    %[-] Übersetzungsverhältnis
motorKnee.Mrg = motorKnee.k*motorKnee.I0g;             %[N.m] -> Reibmoment mit Getriebe
motorKnee.Mrhg = motorKnee.k*motorKnee.Iag;            %[N.m] -> Haftreibmoment mit Getriebe

IC.motor.knee_r = deg2rad(IC.phi.knee_r/motorKnee.i);
IC.motor.knee_l = deg2rad(IC.phi.knee_l/motorKnee.i);

c_coupling.knee = 7/motorKnee.Ra*motorKnee.k/motorKnee.i; %[Nm/°]

%*************************************************************
%MODELCRAFT MC-620 MG-T
%*************************************************************
motorHip.Ra = motorHip.Um/motorHip.Is;                 %[Ohm] Ankerwiderstand
motorHip.Jm = 1/2*motorHip.m*motorHip.r^2;             %[kg*m] Trägheitsmoment des Motors

% motorHip.inductance = motorHip.Ra*(296*1e-6);

motorHip.k = (motorHip.Um-motorHip.I0*motorHip.Ra)*60/(2*pi*motorHip.n0);    %[Vs = Nm/A] -> Motorkonstante

% motorHip.Mrm = motorHip.k*motorHip.I0;                 %[N.m] -> Reibmoment Motor
motorHip.Mrh = motorHip.k*motorHip.Ia;                 %[N.m] -> Haftreibmonent Motor
motorHip.na = (motorHip.Us-(motorHip.I0*motorHip.Ra))/motorHip.k;        %[rad/s] Anlaufdrehzahl

motorHip.Mrg = motorHip.k*motorHip.I0g;                %[N.m] -> Reibmoment mit Getriebe
motorHip.Mrhg = motorHip.k*motorHip.Iag;               %[N.m] -> Haftreibmoment mit Getriebe

IC.motor.hip_r = deg2rad(IC.phi.hip_r/motorHip.i);
IC.motor.hip_l = deg2rad(IC.phi.hip_l/motorHip.i);

c_coupling.hip = 7/motorHip.Ra*motorHip.k/motorHip.i;