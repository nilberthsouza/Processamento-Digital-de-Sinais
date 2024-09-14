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

% Adicionando ruído gaussiano ao sinal
ruido = 0.5 * randn(size(t));  % Ruído gaussiano com desvio padrão de 0.5
x_t_ruido = x_t + ruido;       % Sinal com ruído adicionado

% Janela de Hann
hann_window = hann(length(t))';  % Transpor para linha

% Aplicação da janela de Hann no sinal ruidoso
x_t_ruido_hann = x_t_ruido .* hann_window;

% Transformada de Fourier (FFT) do sinal ruidoso
X_f = abs(fft(x_t_ruido));
f = (0:length(X_f)-1)*(Fs/length(X_f));  % Vetor de frequências

% Transformada de Fourier (FFT) do sinal ruidoso janelado com Hann
X_f_hann = abs(fft(x_t_ruido_hann));

% Gráficos
figure;

% 1. Gráfico do sinal ruidoso no domínio do tempo
subplot(4,1,1);
plot(t, x_t_ruido);
title('Sinal Senoidal com Ruído no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 2. Gráfico da FFT do sinal ruidoso
subplot(4,1,2);
plot(f(1:floor(length(f)/2)), X_f(1:floor(length(f)/2)));
title('Transformada de Fourier (FFT) do Sinal com Ruído');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% 3. Gráfico do sinal ruidoso janelado no domínio do tempo
subplot(4,1,3);
plot(t, x_t_ruido_hann);
title('Sinal Ruidoso Janelado no Domínio do Tempo (Janela de Hann)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 4. Gráfico da FFT do sinal ruidoso janelado com Hann
subplot(4,1,4);
plot(f(1:floor(length(f)/2)), X_f_hann(1:floor(length(f)/2)));
title('Transformada de Fourier (FFT) do Sinal Janelado com Hann');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% Ajustar layout
sgtitle('Sinal Ruidoso, FFT, Janelamento com Hann e FFT Janelada');
grid on;
