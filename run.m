clear all
close all

n=false;
y=true;
f=9e10;    %libpointer é usado como equivalente ao valor NULL noutras linguas
salvar=9e10; 
typewave=9e10;
canalrange=[-10,10];
while f<1==1 || f>9==1
    f=input('Qual é o valor da frequencia entre 1 a 9?:');
end
fs=input('Qual é o valor da frequencia de amostragem (fs)?:');
N=input('Qual é o valor do numero de amostragens (N)?:');

while (typewave~=0)==1 && (typewave~=1)==1
typewave=input('A onda é quadrada?[y/n]:');
if typewave==y
    onda='square';
elseif typewave==n
    onda='sine';
else
    disp('Por favor introduzir no input y ou n')
end
end

if fs==100000
    freqamostr='fs100k';
else
    freqamostr=strcat('fs',int2str(fs));
end
nome=strcat(onda,'_','f',int2str(f),'k','_','A4','_',freqamostr,'_','N',int2str(N),'.mat');



while (salvar~=0)==1 && (salvar~=1)==1
salvar=input(strcat('Guardar o ficheiro-->',nome,'?[y/n]:'));
if salvar==1
    [y,t]=Acquire('ai0',fs,N,canalrange);
    save(nome);
    disp('save funciona')
elseif salvar==0
    disp('load funciona')
    load(nome);
else
    disp('Por favor introduzir no input y ou n')
end
end

%------------------------------------------------------------------
%CALCULO DOS PARAMETROS DE AQUISIÇÃO
%------------------------------------------------------------------
dt=t(2);
df=1/(N*dt);
fmax=fs/2;

disp(strcat('Parametros de aquisição:df=',num2str(df),'//dt=',num2str(dt),'//fmax=',num2str(fmax)))

%------------------------------------------------------------------
%PLOTS
%------------------------------------------------------------------
[Y_1sided,f_1sided] = Spectr(y,t);  %Espectro
[y1,t1]=Integer_Periods(y,t);  %Numero inteiro de periodos
[Y_1sided1,f_1sided1] = Spectr(y1,t1); %Espectro com numero inteiro de periodos
[DC,RMS]=DC_RMS(y1);   %Calculos DC e RMS com numero inteiro de periodos
[amp,thd,p]=harmonics(y1,t1);  %Vectores com harmonicas e distorção harmonica
%------------------------------------------------------------------

if strfind(nome,'sine_f1k_A4_fs100k')==true  %ex 2.1
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.1 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.1 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(3)  
    plot(f_1sided1,20*log10(Y_1sided1))
    title('Espectro 2.1 (Numero inteiro de periodos/DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(4) 
    plot(f_1sided1,Y_1sided1)
    title('Espectro 2.1 (Numero inteiro de periodos/Unidades Lineares)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
elseif strfind(nome,'sine_f1k_A4_fs10600')==true %Ex 2.2
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.2 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.2 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
elseif strfind(nome,'sine_f3k_A4_fs10600')==true %Ex 2.3
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.3 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.3 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
elseif strfind(nome,'sine_f5k_A4_fs10600')==true %Ex 2.4
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.4 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.4 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')    
elseif strfind(nome,'sine_f7k_A4_fs10600')==true %Ex 2.5
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.5 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.5 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV') 
elseif strfind(nome,'sine_f9k_A4_fs10600')==true %Ex 2.6
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.6 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.6 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
elseif strfind(nome,'square_f1k_A4_fs100k')==true  %Ex 2.7
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.7 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.7 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(3)  
    plot(f_1sided1,20*log10(Y_1sided1))
    title('Espectro 2.7 (Numero inteiro de periodos/DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(4) 
    plot(f_1sided1,Y_1sided1)
    title('Espectro 2.7 (Numero inteiro de periodos/Unidades Lineares)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')    
elseif strfind(nome,'square_f1k_A4_fs10600')==true  %Ex 2.8
    figure(1)  
    plot(f_1sided,Y_1sided)
    title('Espectro 2.8 ')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
    figure(2) 
    plot(f_1sided,20*log10(Y_1sided))
    title('Espectro 2.8 (DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(3)  
    plot(f_1sided1,20*log10(Y_1sided1))
    title('Espectro 2.8 (Numero inteiro de periodos/DBs)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / dbV')
    figure(4) 
    plot(f_1sided1,Y_1sided1)
    title('Espectro 2.8 (Numero inteiro de periodos/Unidades Lineares)')
    xlabel('Freq. / Hz')
    ylabel('Amp. / V')
else
    disp('Os dados não correspondem a nenhum exercicio')
end

%---------------------------------------------------------------
%PARAMETROS MEDIDOS
%---------------------------------------------------------------

disp(strcat('Parametros MEDIDOS:ffund=',num2str(p(2)),'//Afund=',num2str(amp(2)),'//DC=',num2str(DC),'//RMS=',num2str(RMS),'//THD[dB]=',num2str(thd)))

p %fi
amp %ai
disp(strcat('Total de_',num2str(length(p)),' harmonicas medidas'))

