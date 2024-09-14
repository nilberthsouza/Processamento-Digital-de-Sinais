% Parâmetros
Fs = 1000;         % Frequência de amostragem (Hz)
N = 500;           % Número de amostras para o sinal original
t_original = (0:N-1)/Fs;  % Vetor de tempo original até 0.5 segundos

% Extensão do tempo até 7.5 segundos (incluindo padding de zeros)
t_total = 0:1/Fs:7.5;     % Tempo total de 0 a 7.5 segundos
N_total = length(t_total); % Número total de amostras

% Sinal original no domínio do tempo
x_t_original = 2*cos(2*pi*30*t_original + pi/2) + 2*cos(2*pi*50*t_original + pi/2);

% Adicionando padding de zeros de 0.5 até 7.5 segundos
x_t_padded = zeros(1, N_total);  % Vetor inicial de zeros
x_t_padded(1:N) = x_t_original;  % Colocando o sinal original nas primeiras N amostras

% Gráfico do domínio do tempo
subplot(2,1,1);
plot(t_total, x_t_padded);
title('Domínio do Tempo com Padding de Zeros');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 0.7]);

% Transformada de Fourier (Domínio da Frequência)
X_f_padded = abs(fft(x_t_padded));

% Vetor de frequências correspondente ao novo comprimento
f_total = (0:N_total-1)*(Fs/N_total);

% Gráfico do domínio da frequência
subplot(2,1,2);
plot(f_total(1:N_total/2), X_f_padded(1:N_total/2));  % Mostrar apenas a metade positiva
title('Domínio da Frequência com Padding de Zeros');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 150]);

% Ajuste da figura para melhor visualização
set(gcf, 'Position', [100, 100, 600, 400]); % Ajuste opcional do tamanho da janela
