function [y,t] = Acquire(canal,fs,N,canalrange)




s=daq.createSession('ni');  % Cria sessão de aquisição com hardware da NI. Informação sobre a sessão está guardada no objeto s
ch=s.addAnalogInputChannel('myDAQ1',canal,'Voltage');  % Adiciona ao objeto o canal de tensão ('Voltage') analog input 0 ('ai0') na placa myDAQ 
ch.Range=canalrange;                                     % Altera o alcance do canal.


s.Rate=fs;                      % Adiciona ao objeto o ritmo de aquisição
s.DurationInSeconds=N/fs;       % Adiciona o tempo total de aquisição = N*dt=N/fs

[y,t]=s.startForeground;        % Inicia a aquisição em foreground, guarda as amostras em y e os instantes em t

s.removeChannel(1)              % Remove o primeiro canal
s.release;                      % Remove todos os recursos associados ao objeto s

end