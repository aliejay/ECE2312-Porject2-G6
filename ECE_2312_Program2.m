% Project 2

Fs = 44000;
f = 5000;
w0 = 2*pi*f;
n = (0:5);
y = sin(w0*n);

file = 'team[6]-stereosoundfile.wav';
[arr, Fs] = audioread(file);

window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[S, F, T, P] = spectrogram(arr, window, N_overlap, N_fft, Fs, 'yaxis');
figure;
surf(T, F, 10*log10(P), 'edgecolor', 'none');
axis tight;
view(0,90);
colormap(jet);
set(gca,'clim', [-80 -20]);
ylim([0 8000]);
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% filename = 'team[6]-sinetone.wav';
% audiowrite(filename, arr, Fs);
% audioinfo(filename)









