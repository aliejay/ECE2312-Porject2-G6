% Project 2

Fs = 44000;
f = 5000;  %For first part
%f = 8000; % For second part
w0 = 2*pi*f;
n = 0:(1/Fs):duration;
amp = 5;

%y = amp*sin(w0*n);
y = amp * chirp(n, 0, duration, 8000);

% file = 'team[6]-stereosoundfile.wav';
% [arr, Fs] = audioread(file);
% audioinfo(file);

% Project 2
info = audiodevinfo;
info.input(1)
info.input(2)

nBits = 8;
nChannels = 1;
duration = 5;

recorder = audiorecorder(Fs, nBits, nChannels, 1);

%pause(3);
disp("Get Ready")
pause(1);

disp("3")
pause(1);

disp("2")
pause(1);

disp("1")
pause(1);

disp("Sound")

record(recorder, duration);

sound(y, Fs)
% Wait 5 seconds
pause(duration);
disp("Recording over")


%disp(y)
arr = getaudiodata(recorder, "double");



clf
t = [0: length(y)-1]/ Fs;
%plot(t, y)
title("Audio")
xlabel("Time (sec)")
ylabel("Magnitude")




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

filename = 'team[6]-chirp.wav';
audiowrite(filename, arr, Fs);
audioinfo(filename)









