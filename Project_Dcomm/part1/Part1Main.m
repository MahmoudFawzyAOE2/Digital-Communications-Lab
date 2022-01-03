clc
clear all 

%%
% Alexandria University
% Faculty of Engineering
% Electrical and Electronic Engineering Department
% Course: Digital Communications Lab 
% Project Part 1:  Inter-Symbol Interference due to band-limited channels

%% Constants
Fs = 1e5;                          % Sampling rate (samples per sec)
Ts = 1/Fs;                         % Sampling time

N = 102400 -1;                    % Total number of samples
axis_t = (0:N-1)*Ts;  % Time axis (the same during the entire experiment)

axis_f = 0:Fs/length(axis_t):Fs/2; % Time axis (the same during the entire experiment)

% one square pulse with the following parameters
E_bit = 1; % The total energy of all samples constituting the square pulse

B = 100 ;
T_sq = 2/B;                  % The duration of the square pulse (an integer number of sampling times)
p = 0.5;

%% Part 1-a: Generate a pulse

x_bits = 1;
signal_t = GenerateSquarePulses(axis_t,T_sq,E_bit,Fs,x_bits,'unipolar'); 

Analysis( signal_t, B, Fs, axis_t ,axis_f, T_sq);

%% Part 1-b: concatinate 2 pulses
x_bits = [1 1];

signal_t = GenerateSquarePulses(axis_t,T_sq,E_bit,Fs,x_bits,'unipolar'); 

signal_t_square = Analysis( signal_t, B, Fs, axis_t ,axis_f, T_sq);

%% Part 1-c: Generate a triangle pulse
signal_t = GenerateTrianglePulses(axis_t,T_sq,E_bit,Fs,x_bits,'unipolar'); 

signal_t_triangle = Analysis( signal_t, B, Fs, axis_t ,axis_f, T_sq);

%% Part 1-d: Generate a Sinusoidal pulse
signal_t = GenerateSinusoidalPulses(axis_t,T_sq,E_bit,Fs,x_bits,'unipolar'); 

signal_t_sinusoidal = Analysis( signal_t, B, Fs, axis_t ,axis_f, T_sq);

