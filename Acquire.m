function [y,t] = Acquire(canal,fs,N,canalrange)




s=daq.createSession('ni');  % Cria sess�o de aquisi��o com hardware da NI. Informa��o sobre a sess�o est� guardada no objeto s
ch=s.addAnalogInputChannel('myDAQ1',canal,'Voltage');  % Adiciona ao objeto o canal de tens�o ('Voltage') analog input 0 ('ai0') na placa myDAQ 
ch.Range=canalrange;                                     % Altera o alcance do canal.


s.Rate=fs;                      % Adiciona ao objeto o ritmo de aquisi��o
s.DurationInSeconds=N/fs;       % Adiciona o tempo total de aquisi��o = N*dt=N/fs

[y,t]=s.startForeground;        % Inicia a aquisi��o em foreground, guarda as amostras em y e os instantes em t

s.removeChannel(1)              % Remove o primeiro canal
s.release;                      % Remove todos os recursos associados ao objeto s

end