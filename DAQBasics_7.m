% Script with basic foreground data acquisition in Matlab
%
%
% utilizar daq.getVendors para saber quais s�o os fabricantes com
% dispositivos dispon�veis
%
%
% utilizar daq.getDevices para saber quais s�o os dispositivos dispon�veis
%

close all
clear all

fs=10000;  % Sampling frequency
N=100;     % Number of samples to acquire


s=daq.createSession('ni');  % Cria sess�o de aquisi��o com hardware da NI. Informa��o sobre a sess�o est� guardada no objeto s
ch=s.addAnalogInputChannel('myDAQ1','ai0','Voltage');  % Adiciona ao objeto o canal de tens�o ('Voltage') analog input 0 ('ai0') na placa myDAQ 
ch.Range=[-10,10];                                     % Altera o alcance do canal


s.Rate=fs;                      % Adiciona ao objeto o ritmo de aquisi��o
s.DurationInSeconds=N/fs;       % Adiciona o tempo total de aquisi��o = N*dt=N/fs

[y,t]=s.startForeground;        % Inicia a aquisi��o em foreground, guarda as amostras em y e os instantes em t

s.removeChannel(1)              % Remove o primeiro canal
s.release;                      % Remove todos os recursos associados ao objeto s



figure(1)
plot(t, y)
axis([0 0.004 -5 5])
xlabel('Tempo / s')
ylabel('Amplitude / V')
title('');


Y=fft(y)/N;
Y1(1)=Y(1);
Y1(2:N/2)=2*Y(2:N/2);

df=fs/N;
freq=(0:N/2-1)*df;


figure(2)
plot(freq,abs(Y1))
xlabel('Frequ�ncia / Hz')
ylabel('Amplitude / V')

figure(3)
Y1_dB=20*log10(abs(Y1));
plot(freq,Y1_dB)
xlabel('Frequ�ncia / Hz')
ylabel('Amplitude / dBV')


freal=ipdft(y,fs)