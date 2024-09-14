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

% Gráficos
figure;

% 1. Gráfico do sinal no domínio do tempo
subplot(3, 1, 1);
plot(t, x_t);
title('Sinal Senoidal com Variação de Frequência no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 2. Gráfico da janela de Hann
subplot(3, 1, 2);
plot(t, hann_window);
title('Janela de Hann');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 3. Gráfico do sinal janelado no domínio do tempo
subplot(3, 1, 3);
plot(t, x_t_hann);
title('Sinal Janelado no Domínio do Tempo (Janela de Hann Aplicada)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% Ajustar layout
sgtitle('Sinal Senoidal com Janelamento de Hann');
grid on;
