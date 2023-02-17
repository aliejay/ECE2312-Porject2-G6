% Project 2

Fs = 44000;
Fs1 = 44000;
f = 5000;  %For first part
%f = 8000; % For second part

w0 = 2*pi*f;
w0_1 = 2*pi*1568; % G6
w0_2 = 2*pi*1760; % A6
w0_3 = 2*pi*1397; % F6
w0_4 = 2*pi*698; % F5
w0_5 = 2*pi*1046; % C6

duration = 5;

n = 0:(1/Fs):duration;
n3_1 = 0: 1/Fs: 0.5;
n3_2 = 0.5: 1/Fs: 1.25;
n3_3 = 1.25: 1/Fs: 2.25;
n3_4 = 2.25: 1/Fs: 3;
n3_5 = 3: 1/Fs: 5;
amp = 1;


%y = amp*sin(w0*n);
%y = amp * chirp(n, 0, duration, 8000);
y1 = amp*sin(w0_1*n3_1);
y2 = amp*sin(w0_2*n3_2);
y3 = amp*sin(w0_3*n3_3);
y4 = amp*sin(w0_4*n3_4);
y5 = amp*sin(w0_5*n3_5);

% file1 = 'team[6]-stereosoundfile.wav';
% [arr, Fs] = audioread(file1);
% audioinfo(file1);

%y = y1 + y2 + y3 + y4 + y5;


% Project 2
info = audiodevinfo;
info.input(1)
info.input(2)

nBits = 8;
nChannels = 1;

recorder = audiorecorder(Fs, nBits, nChannels, 1);

%pause(3);
% disp("Get Ready")
% pause(1);
% 
% disp("3")
% pause(1);
% 
% disp("2")
% pause(1);
% 
% disp("1")
% pause(1);
% 
% disp("Sound")

record(recorder, duration);

% sound(y1, Fs)
% pause(0.5);
% sound(y2, Fs)
% pause(0.75);
% sound(y3, Fs)
% pause(1);
% sound(y4, Fs)
% pause(0.75);
% sound(y5, Fs)
% pause(2);

% sound(y, Fs)
% sound(arr, Fs)

% Wait 5 seconds
pause(duration);
% disp("Recording over")

%disp(y)
% arr1 = getaudiodata(recorder, "double");
% 
% N = 255;
% F = [0 0.45 0.55 1];
% A = [1 1 0 0];
% 
% b =  firls(N, F, A);
% disp(b)
% audio = filter(b, 1, arr1);

%arr = arr + arr1;
% arr2 = zeros(length(arr), 1);
% for i = 1:length(arr)
%     arr2(i) = arr1(i) + arr(i);
% end
% 
% arrMix = [arr(:), arr2(:)];


clf
t = [0: length(y)-1]/ Fs;
%plot(t, y)
title("Audio")
xlabel("Time (sec)")
ylabel("Magnitude")


window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[S, F, T, P] = spectrogram(y, window, N_overlap, N_fft, Fs, 'yaxis');
figure;
surf(T, F, 10*log10(P), 'edgecolor', 'none');
axis tight;
view(0,90);
colormap(jet);
set(gca,'clim', [-80 -20]);
ylim([0 8000]);
xlabel('Time (s)');
ylabel('Frequency (Hz)');


filename = 'team[6]-filteredspeechsine.wav';
audiowrite(filename,audio,Fs);
audioinfo(filename);









