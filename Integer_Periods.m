function [y1,t1]= Integer_Periods(y,t)

%festimada=IpDFT(y,fs);
%npp=fs/festimada;
%Nperiodos=N/npp;
%Nperiodosint=floor(Nperiodos);
%Navg=Nperiodosint*npp

%ESTIMATIVA DO VALOR MEDIO (PAG 97 SIS AQUIS)
N=length(t);  %Numero de amostragem N é o numero de valores do vector t
dt=t(2);         %Tempo de amostragem, primeiro valor é sempre 0 em s/S ou seja, intrevalo de tempo em cada amostragem aka resolução temporal da amostragem
fs=1/dt ;        %Inverso de dt, quantidade de samples POR SEGUNDO aka frequencia de amostragem
f=IpDFT(y,fs);   %f estimada atraves de FFT (como sugerido no enunciado)

Npp=fs/f;   %nº pontos por periodo com freq amostr e f estimada apartir de fft

Np=N/Npp;   %nº periodos

Npi = floor(Np); %Nº periodos INTEIROS --> arredondamento PARA BAIXO

Navg = round(Npi*Npp);  %formula (NPP pode ser decimal)

y1=y(1:Navg);   %um vetor de amostras com um numero inteiro de periodos
t1=t(1:Navg);   %um vector com os correspondentes instantes de amostragem



end