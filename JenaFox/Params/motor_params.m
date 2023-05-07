% GC.gain = 20;
% GC.level = 0.2;

% Ue = 4.8;
% Ue_hip.back = 1.7;
% Ue_hip.for = 3;
% Ue_knee.back = 1;
% Ue_knee.for = 2;
% Ue_knee.hold = 0.6;
amplifier = 2.28;


%% Motor initial position
IC_v.motorHip = 0;
IC_v.motorKnee = 0;


%% Parameters elastic coupling
% d_coupling.hip = 0;
d_coupling.knee = 0.5;


%% MODELCRAFT MC-620 MG-T
motorHip.I0 = 0.066;
motorHip.I0g = 0.1;
motorHip.Ia = 0.078;
motorHip.Iag = 0.119;
% motorHip.Im = 0.25;
motorHip.Is = 0.91;
% motorHip.Jg = 1.5e-07;
motorHip.Um = 5;
motorHip.Us = 0.7;
motorHip.i = 0.0033279;
motorHip.m = 0.008;
motorHip.n0 = 13800;
% motorHip.nm = 10870;
motorHip.r = 0.005;


%% HiTec HS-82MG - 12133
motorKnee.I0 = 0.08;
motorKnee.I0g = 0.11;
motorKnee.Ia = 0.142;
motorKnee.Iag = 0.161;
% motorKnee.Im = 0.29;
motorKnee.Is = 1.35;
% motorKnee.Jg = 1.46e-07;
motorKnee.Um = 1.5;
motorKnee.Us = 0.9;
% motorKnee.amp = 0.15;
motorKnee.m = 0.004;
motorKnee.n0 = 22600;
% motorKnee.nm = 20600;
motorKnee.r = 0.004;
