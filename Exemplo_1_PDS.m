%exemplo 1

% Parâmetros
Fs = 1000;         % Frequência de amostragem (Hz)
N = 500;           % Número de amostras
t = (0:N-1)/Fs;    % Vetor de tempo até N amostras
f = (0:N-1)*(Fs/N); % Frequências correspondentes

% Sinal no domínio do tempo
x_t = 2*cos(2*pi*31*t) + 2*cos(2*pi*51*t);

% Gráfico do domínio do tempo
subplot(2,1,1);
plot(t, x_t);
title('Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 0.5]);

% Transformada de Fourier (Domínio da Frequência)
X_f = abs(fft(x_t));

% Gráfico do domínio da frequência
subplot(2,1,2);
plot(f(1:N/2), X_f(1:N/2));  % Mostrar apenas a metade positiva
title('Domínio da Frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% Ajuste da figura para melhor visualização
set(gcf, 'Position', [100, 100, 600, 400]); % Ajuste opcional do tamanho da janela
