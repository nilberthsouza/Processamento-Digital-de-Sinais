% Parâmetros
Fs = 1000;         % Frequência de amostragem (Hz)
N = 1000;          % Número de amostras para o sinal original (até 1 segundo)
t_original = (0:N-1)/Fs;  % Vetor de tempo original até 1 segundo

% Extensão do tempo até 10 segundos (incluindo padding de zeros)
t_total = 0:1/Fs:10;      % Vetor de tempo de 0 a 10 segundos
N_total = length(t_total); % Número total de amostras (0 a 10 segundos)

% Geração de frequências aleatórias distintas entre 10 Hz e 100 Hz
frequencias = [96 100 16 95];  % 4 frequências distintas aleatórias entre 1 e 100 Hz
amplitudes = 2 * rand(1, 4);     % Amplitudes aleatórias entre 0 e 2

% Geração do sinal original como soma de 4 cossenos
x_t_original = amplitudes(1)*cos(2*pi*frequencias(1)*t_original) + ...
               amplitudes(2)*cos(2*pi*frequencias(2)*t_original) + ...
               amplitudes(3)*cos(2*pi*frequencias(3)*t_original) + ...
               amplitudes(4)*cos(2*pi*frequencias(4)*t_original);

% Adicionando padding de zeros de 1 até 10 segundos
x_t_padded = zeros(1, N_total);  % Vetor de zeros para 10 segundos
x_t_padded(1:N) = x_t_original;  % Colocar o sinal original nos primeiros 1000 pontos

% Gráfico do domínio do tempo com padding
subplot(2,1,1);
plot(t_total, x_t_padded);
title('Domínio do Tempo com Padding de Zeros');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10]);

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
