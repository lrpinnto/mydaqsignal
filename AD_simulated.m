function Vout=AD_simulated(Vin,n_bits,V_AD_min,V_AD_max)

% Simulates an ideal Analog to Digital Converter
% Vin is the analog input voltage
% n_bits is the number of bits of the converter
% V_AD_max and V_AD_min are the saturation values of the converter
% Vout is the discretized voltage

if Vin >= V_AD_max

    Vout=V_AD_max;      % Upper limit saturation

elseif Vin <= V_AD_min

    Vout=V_AD_min;      % Lower limit saturation

else
    
    LSB = (V_AD_max-V_AD_min)/(2^n_bits-1); % 1 LSB value in Volt
    ADC_code=round((Vin-V_AD_min)/LSB);     % (decimal) code of the input voltage
    Vout=ADC_code*LSB+V_AD_min;             % Discretized voltage

end

    