function [Y_1sided,f_1sided] = Spectr(y,t)

N=length(t);    %Numero de amostragem N é o numero de valores do vector t 
dt=t(2); %Tempo de amostragem, primeiro valor é sempre 0 em s/S ou seja, intrevalo de tempo em cada amostragem aka resolução temporal da amostragem
fs=1/dt;  %Inverso de dt, quantidade de samples POR SEGUNDO aka frequencia de amostragem


%dt=1/fs;

Y=fft(y)/N;   % Vem com f=0, f positivas e só depois as negativas. Divide-se por N para normalizar os resultados da transformada.
Y1=abs(Y);  %devolve o valor ABSOLUTO incluindo a MAGNITUDE de valores complexos. exemplo |1+2i|=sqrt(5)

df=1/(N*dt); %delta f -> resolução na frequencia do espectro
%f vai de -numero de nyquist (fs/2) ao numero de nyquist
%spectral leakage ocorre quando f/df =/= N

% One_sided spectrum
f_1sided = (0:N/2-1)*df;
Y_1sided(1) = Y1(1);     % Componente DC
Y_1sided(2:floor(N/2)) = 2*Y1(2:floor(N/2));   % Converte de 2 sided para 1 sided

end