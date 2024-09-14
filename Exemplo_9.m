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

% Janela de Hann
hann_window = hann(length(t))';  % Transpor para linha

% Aplicação da janela de Hann no sinal
x_t_hann = x_t .* hann_window;

% Transformada de Fourier
X_f = abs(fft(x_t));
X_f_hann = abs(fft(x_t_hann));
f = (0:length(t)-1)*(Fs/length(t));  % Vetor de frequências

% Gráficos
figure;

% 1. Gráfico do sinal no domínio do tempo
subplot(4, 1, 1);
plot(t, x_t);
title('Sinal Senoidal com Variação de Frequência no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 2. Gráfico da Transformada de Fourier do sinal original
subplot(4, 1, 2);
plot(f(1:length(t)/2), X_f(1:length(t)/2));  % Mostrar apenas a metade positiva
title('Transformada de Fourier do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% 3. Gráfico do sinal janelado no domínio do tempo (Hann)
subplot(4, 1, 3);
plot(t, x_t_hann);
title('Sinal Janelado no Domínio do Tempo (Janela de Hann)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 4. Gráfico da Transformada de Fourier do sinal janelado (Hann)
subplot(4, 1, 4);
plot(f(1:length(t)/2), X_f_hann(1:length(t)/2));  % Mostrar apenas a metade positiva
title('Transformada de Fourier do Sinal Janelado (Hann)');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% Ajustar layout
sgtitle('Sinal Senoidal e Transformada de Fourier com Janelamento de Hann');
grid on;
