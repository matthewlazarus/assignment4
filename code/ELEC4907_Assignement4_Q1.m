% Matthew Lazarus 100962142 

%% Assignment 4

%% Part 1
% In this part, we repeat the work done for PA9. First, the given circuit
% is written in MNA form using a C, G and b matrix. 

clearvars;
clear;
clear all;
close all;
clc;

% Write the circuit using MNA formulation. This could also be done using
% stamps. 
G = zeros(8,8); 
C = zeros(8,8); 
b = zeros(8,1); 
R1 =1;
R2 = 2;
c = 0.25;
R3=10;
L=0.2;
alpha = 100;
R4=0.1;
R0 = 1000;

G(1,1) = 1/R1;
G(2,1) = -1/R1;
G(1,2) = -1/R1;
G(2,2) = 1/R1+1/R2;
G(3,3) = 1/R3;
G(4,4)=1/R4;
G(5,5)=1/R0+1/R4;
G(4,5)=-1/R4;
G(5,4)=-1/R4;
G(1,6)=1;
G(6,1)=1;
G(7,2)=1;
G(2,7)=1;
G(3,7)=-1;
G(7,3)=-1;
G(8,3)=-alpha/R3;
G(8,4)=1;
G(4,8)=1;

C(1,1)=c;
C(2,2)=c;
C(1,2)=-c;
C(2,1)=-c;
C(7,7)=-L;

%% 
% The C and G matrices are:
C
G

%% i)
% Consider the DC Case. Plot the input voltage (V1) from -10V to 10V, and
% plot the output voltage and V3. Here, the output voltage is X(5) and the
% voltage at V3 is X(3).

inputV = linspace(-10,10,100);
v3 = zeros(length(inputV),1);
v0 = zeros(length(inputV),1);
for count = 1:length(inputV)
    b(6)=inputV(count);
    X=G\b;
    v3(count) = X(3);
    v0(count) = X(5);
end

%% 
% As seen in the figures below, when the input voltage varies from -10V to
% 10V, V3 varies from -6V to 6V and the output voltage varies from -60V to
% 60V. 

figure(1)
plot(inputV,v3);
xlabel('V1')
ylabel('V3')
title('V3 vs V1')

figure(2)
plot(inputV,v0);
xlabel('V1')
ylabel('V0')
title('V0 vs V1')

%% ii)
% Now consider the AC case. Plot the output voltage and gain as a function
% of frequency. 

f = linspace(0, 10000, 100000);
v0 = zeros(length(f),1);
gainDB=zeros(length(f),1);
for count=1:length(f)
    X=[];
    s = 1i*2*pi*f(count); %Frequency 
    X=inv((G+((s).*C)))*b; 
    v0(count) = abs(X(5));   
    
    gainDB(count) = 20*log10(abs(X(5))/abs(X(1)));
end

figure(3)
semilogx(2*pi*f,v0);
xlabel('Frequency (rads/sec)')
ylabel('V0')
title('AC plot of V0')

figure(4)
semilogx(2*pi*f, gainDB);
xlabel('Frequency (rads/sec)')
ylabel('Gain - V0/V1 (dB)')
title('AC plot of Gain');

%% iii)
% Vary the capacitance value and plot the distribution of the gain using a
% histogram. 

v0 = zeros(length(f),1);
gainDB=zeros(length(f),1);
for count=1:length(gainDB)
    X=[];
    perturbation = randn()*0.05;
    C(1,1)=c*(1-perturbation);
    C(2,2)=c*(1-perturbation);
    C(1,2)=-c*(1-perturbation);
    C(2,1)=-c*(1-perturbation);

    s = 1i*pi*1;
    X=inv((G+((s).*C)))*b; 
    v0(count) = abs(X(5));   
    gainDB(count) = 20*log10(abs(X(5))/abs(X(1)));
end
figure;
hist(gainDB,80);
xlabel('Gain (dB)')
ylabel('Count')
title('Histogram of Gain with Perturbations on C')
