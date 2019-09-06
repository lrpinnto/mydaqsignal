function f=ipdft(array_acq,fs)

N_amostras=length(array_acq);
df=fs/N_amostras;
%f_total=[0:N_amostras/2 -N_amostras/2+1:1:-1]*df;

fft_array=fft(array_acq)/N_amostras;
abs_fft_array=abs(fft_array);
abs_fft_array(1)=0;

if floor(N_amostras/2)==N_amostras/2
    abs_fft_array(N_amostras/2+1:end)=0;
else
    abs_fft_array((N_amostras-1)/2+2:end)=0;
end


%figure(1),plot(f_total,abs_fft_array);


[~,indice]=max(abs_fft_array);
if abs_fft_array(indice-1) > abs_fft_array(indice+1)
    indice1=indice-1;
    indice2=indice;
else
    indice1=indice;
    indice2=indice+1;
end


%[indice1 indice2]
%abs_fft_array(indice1-1:indice2+1)
%df

n=2*pi/N_amostras;
UL=real(fft_array(indice1));
UL1=real(fft_array(indice2));
VL=imag(fft_array(indice1));
VL1=imag(fft_array(indice2));
kopt=(((sin(n*indice1))*(VL1-VL))+((cos(n*indice1))*(UL1-UL)))/(UL1-UL);
Z1=VL*((kopt-cos(n*indice1))/(sin(n*indice1)))+UL;
Z2=VL1*((kopt-cos(n*indice2))/(sin(n*indice2)))+UL1;
lambda=(acos((Z2*cos(n*indice2)-Z1*cos(n*indice1))/(Z2-Z1)))/n;
f=df*(lambda-1);
f=real(f);
if imag(f)~=0
    keyboard
end