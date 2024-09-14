% Parâmetros
Fs = 1000;           % Frequência de amostragem (Hz)
duracao = 2.5;       % Duração do sinal em segundos
t = 0:1/Fs:duracao;  % Vetor de tempo

% Frequências para cada segmento de 0.5 segundos
frequencias = [5, 20, 50, 80, 120];  % Frequências em Hz
segmento = 0.5;      % Duração de cada segmento (0.5 segundos)

% Inicializando o sinal
x_t = zeros(size(t));

% Geração da onda senoidal com variação de frequência
for i = 1:length(frequencias)
    % Índices correspondentes ao intervalo de tempo
    inicio = (i-1)*segmento*Fs + 1;
    fim = min(i*segmento*Fs, length(t));
    
    % Preenchendo o sinal com a frequência correspondente
    x_t(inicio:fim) = cos(2*pi*frequencias(i)*t(inicio:fim));
end

% Aplicação do método de Welch para calcular a FFT
window = hann(256);         % Janela de Hann com 256 pontos
noverlap = 128;             % Sobreposição de 128 pontos
nfft = 512;                 % Número de pontos da FFT

% Aplicando o método de Welch
[Pxx_welch, f_welch] = pwelch(x_t, window, noverlap, nfft, Fs);

% Gráfico do sinal no domínio do tempo
figure;

subplot(2,1,1);
plot(t, x_t);
title('Sinal Senoidal com Variação de Frequência no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% Gráfico do espectro de potência utilizando o método de Welch
subplot(2,1,2);
plot(f_welch, 10*log10(Pxx_welch));  % Espectro de potência em dB
title('Espectro de Potência (Método de Welch)');
xlabel('Frequência (Hz)');
ylabel('Potência (dB/Hz)');
xlim([0 150]);

% Ajustar layout
sgtitle('Sinal Senoidal e Espectro de Potência com Método de Welch');
grid on;
