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

% Gráficos
figure;

% 1. Gráfico do sinal ruidoso no domínio do tempo
subplot(2,1,1);
plot(t, x_t_ruido);
title('Sinal Senoidal com Ruído no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 duracao]);

% 2. Espectro usando o método de Welch
subplot(2,1,2);
% Estimação do espectro usando o método de Welch
[pxx, f] = pwelch(x_t_ruido, hamming(256), 128, 1024, Fs);

plot(f, 10*log10(pxx));  % Converter para dB
hold on;

% Adicionando retas verticais nas frequências especificadas
colors = ['r', 'g', 'b', 'm', 'k'];  % Cores para as linhas verticais
for i = 1:length(frequencias)
    line([frequencias(i) frequencias(i)], ylim, 'Color', colors(i), 'LineStyle', '--', 'LineWidth', 1.5);
end

% Adicionando a legenda
legendStrings = arrayfun(@(x) sprintf('Frequência %d Hz', x), frequencias, 'UniformOutput', false);
legend(legendStrings, 'Location', 'northeast');

title('Estimativa do Espectro de Potência pelo Método de Welch');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
xlim([0 150]);
grid on;
hold off;
