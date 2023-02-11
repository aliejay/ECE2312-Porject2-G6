info = audiodevinfo;
info.input(1)
info.input(2)

Fs = 44000;
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

disp("Start Speaking")

record(recorder, duration);


% Wait 5 seconds
pause(duration);
disp("Recording over")


audioArray = getaudiodata(recorder, "double");
zerosArr = zeros(length(audioArray),1);

audioArraya = [audioArray(:), zerosArr(:)];

% 
% clf
% t = [0: length(audioArray)-1]/ Fs;
% plot(t, audioArray)
% title("Audio")
% xlabel("Time")
% ylabel("Magnitude")


window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[S, F, T, P] = spectrogram(audioArray, window, N_overlap, N_fft, Fs, 'yaxis');
figure;
surf(T, F, 10*log10(P), 'edgecolor', 'none');
axis tight;
view(0,90);
colormap(jet);
set(gca,'clim', [-80 -20]);
ylim([0 8000]);
xlabel('Time (s)');
ylabel('Frequency (Hz)');


filename = 'team[6]-stereosoundfile.wav';
audiowrite(filename, audioArraya, Fs);
audioinfo(filename)
[y, Fs] = audioread(filename);
disp(y)

% window = hamming(512);
% N_overlap = 256;
% N_fft = 1024;
% [S, F, T, P] = spectrogram(y, window, N_overlap, N_fft, Fs, 'yaxis');
% figure;
% surf(T, F, 10*log10(P), 'edgecolor', 'none');
% axis tight;
% view(0,90);
% colormap(jet);
% set(gca,'clim', [-80 -20]);
% ylim([0 8000]);
% xlabel('Time (s)');
% ylabel('Frequency (Hz)');





