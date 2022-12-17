
M = 16;
m = log2(M);

data = randi([0 1],1000*m,1);

transmitted_signal = qammod(data,M,'InputType','bit','UnitAveragePower',true);

received_signal = awgn(transmitted_signal,25);

cd = comm.ConstellationDiagram('ShowReferenceConstellation',false);
cd(received_signal)

demodulated_signal = qamdemod(received_signal,M,'bin','OutputType','bit');
cd2 = comm.ConstellationDiagram('ShowReferenceConstellation',false);
cd2(demodulated_signal)
