% Parâmetros
Fs = 1000;         % Frequência de amostragem (Hz)
N = 1000;          % Número de amostras
t = (0:N-1)/Fs;    % Vetor de tempo

% Geração de frequências aleatórias distintas entre 10 Hz e 100 Hz
frequencias = [96 100 16 95];  % 4 frequências distintas aleatórias entre 1 e 100 Hz
amplitudes = 2 * rand(1, 4);     % Amplitudes aleatórias entre 0 e 2

% Geração do sinal como soma de 4 cossenos com frequências e amplitudes aleatórias
x_t = amplitudes(1)*cos(2*pi*frequencias(1)*t) + ...
      amplitudes(2)*cos(2*pi*frequencias(2)*t) + ...
      amplitudes(3)*cos(2*pi*frequencias(3)*t) + ...
      amplitudes(4)*cos(2*pi*frequencias(4)*t);

% Gráfico do domínio do tempo
subplot(2,1,1);
plot(t, x_t);
title('Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 1]);

% Transformada de Fourier (Domínio da Frequência)
X_f = abs(fft(x_t));
f = (0:N-1)*(Fs/N);  % Vetor de frequências

% Gráfico do domínio da frequência
subplot(2,1,2);
plot(f(1:N/2), X_f(1:N/2));  % Mostrar apenas a metade positiva
title('Domínio da Frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% Ajuste da figura para melhor visualização
set(gcf, 'Position', [100, 100, 600, 400]); % Ajuste opcional do tamanho da janela
