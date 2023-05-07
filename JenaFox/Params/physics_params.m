%% Initial conditions
IC.y_com = 0.288; % [m]
IC.c_z = 0.1;
IC.d_z = 0.001;

d_joint = 1e-3; % [Nms/deg]


%% Hard stop parameters
c_hs = 0.1;
d_hs = 0.35;


%% Environment
g = 9.8066;
mu.slide = 4.6;
mu.stick = 0.8;


%% Compliance
springAnkle.c_l = 500; % [N/m] Ankle spring constant
springAnkle.c_r = 500;
springAnkle.rl_l = 0.11; % [m] Ankle spring rest length
springAnkle.rl_r = 0.11;
damperAnkle.l = 10; % [Ns/m] Ankle damping coeff.
damperAnkle.r = 10;


%% Ground contact model
v.gx_max = 0.06; % [m/s] Horizontal max relaxation speed
v.gy_max = 0.7; % [m/s]
v.limit = 0.01; % Sliding to stiction limit velocity
