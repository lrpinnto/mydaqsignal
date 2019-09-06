function [DC,RMS] = DC_RMS(y1)

Navg=length(y1);   %Como o valor y1 prov�m da fun��o "Integer_Periods" que devolve y de 1:Navg, utilizando a func length() ir� devolver Navg

DC = sum(y1)/Navg;   %DC -> VALOR MEDIO -> Estimativa de 1 valor medio (pag 95)
RMS = sqrt((1/Navg)*(sum(y1.^2)));  %VALOR EFICAZ -> PAG 98 / (y1.^2) � a potencia de 2 ELEMENTO A ELEMENTO -> alternativamente times(y1,^2)

end