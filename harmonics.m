function[A_harm,thd,f_harm]=harmonics(y,t)

dt=t(2)-t(1);
fs=1/dt;   %freq amostragem
[Y_1sided,f_1sided]=Spectr(y,t);   %y e f
ffund=IpDFT(y,fs); %f fundamental

f_harm(1)=0;            %frequencia DC é 0
A_harm(1)=Y_1sided(1);  %harmonica DC
%Numero de harmonicas=Freq de nyquist/Frequencia
Numero_de_harmonicas=(fs/2)/ffund;  %numero de harmonicas
opcao=input('numero de harmonicas a considerar para o calculo da thd? (Deixar em branco para numero maximo):');
if isempty(opcao)   %verifica se a variavel opcao é null
    nr_harm=Numero_de_harmonicas;
else
    nr_harm=opcao;
end
for i=1:ceil(nr_harm-1) %até 9 porque a partir de 9 o valor estabiliza. Idealmente poderiamos usar Freq nyquist/F ou a variavel Numero_de_harmonicas
    fsearch=ffund*i;   %f(1) é o valor DC já adicionado anteriormente, o resto das harmonicas vão se distribuir f,2f,3f,...
    [A_min,I]=min(abs(f_1sided-fsearch));  %finds the indices of the minimum values of A_min and returns them in output vector I. I é o indice do valor f mais baixo. Basicamente vai à procura do valor mais proximo de nFfundamental, daí a subtracção, o valor mais pequeno é o valor mais proximo da fundamental.
    f_harm(i+1)=f_1sided(I); %O indice do f mais pequeno corresponde ao valor da harmonica
    A_harm(i+1)=Y_1sided(I); %O mesmo se verifica aqui, neste caso vamos buscar o valor ao Y da spectr.
end

thd=20*log10(sqrt(sum(A_harm(3:end).^2/A_harm(2)^2))); % distorçao harmonica


end