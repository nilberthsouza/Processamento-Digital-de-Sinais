close all;
clear;
clc;

fs = 100; %frequência de amostragem
t = 0:1/fs:(10-1/fs); %vetor tempo de amostras em 10s

f1 = 15; f2 = 40;

x = 1.3*sin(2*pi*f1*t) + 1.7*sin(2*pi*f2*t) + 2.5*randn(size(t));

n = length(x);
y = fft(x,n);
Y = abs(y); %espectro de magnitude do sinal

f = (0:n-1)*fs/n;

% Gráfico 1: Resposta em Frequência
subplot(2,1,1) % duas linhas, uma coluna, posição 1
plot(f, Y)
ylabel('Magnitude de Y')
title('Resposta em Frequência')

% Gráfico 2: Periodograma do Espectro de Potência
pot = y.*conj(y)/n;
subplot(2,1,2) % duas linhas, uma coluna, posição 2
plot(f, pot)
xlabel('Frequência (Hz)')
ylabel('Potência')
title('Periodograma do Espectro de Potência')
