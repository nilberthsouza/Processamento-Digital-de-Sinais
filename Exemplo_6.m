% Parâmetros
Fs = 1000;         % Frequência de amostragem (Hz)
N = 1000;          % Número de amostras
t = (0:N-1)/Fs;    % Vetor de tempo

% Geração de frequências aleatórias
frequencias = [96 100 16 95];  % Frequências distintas entre 10 Hz e 100 Hz
amplitudes = 2 * rand(1, 4);   % Amplitudes aleatórias entre 0 e 2

% Geração do sinal como soma de 4 cossenos com frequências e amplitudes aleatórias
x_t = amplitudes(1)*cos(2*pi*frequencias(1)*t) + ...
      amplitudes(2)*cos(2*pi*frequencias(2)*t) + ...
      amplitudes(3)*cos(2*pi*frequencias(3)*t) + ...
      amplitudes(4)*cos(2*pi*frequencias(4)*t);

% Janela de Hann
hann_window = hann(N)';  % Transpor para linha

% Aplicação da janela de Hann no sinal
x_t_hann = x_t .* hann_window;

% Gráficos
figure;

% 1. Gráfico do sinal no domínio do tempo
subplot(3, 1, 1);
plot(t, x_t);
title('Sinal no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 1]);

% 2. Gráfico da janela de Hann
subplot(3, 1, 2);
plot(t, hann_window);
title('Janela de Hann');
xlabel('Tempo (s)');
ylabel('Amplitude');

% 3. Gráfico do sinal janelado no domínio do tempo
subplot(3, 1, 3);
plot(t, x_t_hann);
title('Sinal Janelado no Domínio do Tempo (Janela de Hann)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 1]);

% Ajustar layout
sgtitle('Análise do Sinal com Janela de Hann');
