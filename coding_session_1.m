function coding_session_1

% prepare the plot by closing all open plot windows. 

% SEQUENCES
% Create a vector that represents the sequence. x = [2 4 6 3] and n0 is 2
x = [2 4 6 3]
n0 = 2

% The first The first element is index 1 in MATLAB

fprintf('the element at time 0 is ')
x(1)
fprintf('the element at time 3 is ')
x(4)


% Create the time axis
Time = ( 1:length(x) ) - n0;

% Plot the sequence
stem(Time, x, 'b'), xlabel('Index n'); ylabel('Sequence x[n]'); box('off');


% Impulse Response
% An impulse at element 10 could be formed as x = zeros(1, 20); x(10) = 1; n0 = 10;
d = zeros(1, 20); 
d(10) = 1; 
n0 = 10;

Time = ( 1:length(d) ) - n0;
clf
stem(Time, d, 'b'), xlabel('Index n'); ylabel('Sequence d[n]'); box('off');
%  NOTE that this sequence is indexed from 1


% Sinusoidal Sequence
% Sinusoidal sequences use the sin() and cos() functions.

% assign time 
t = 0:0.01:10;  % Time in seconds (NOT a discrete index)
% Our sinusoidal signal is s = 5 * sin(2*pi*2*t)\n
s = 5 * sin(2*pi*2*t); 
n0 = 1;


% Create time axis.
Time = ( 1:length(s) ) - n0; 
clf
stem(Time, s, 'b'), xlabel('Index n'); ylabel('Sequence s[n]'); box('off');

% Is this signal periodic? If yes, please print the period
fprintf('Function is periodic.  Period = 50.\n');



% Complex valued sequence
% Our signal is x2 = 5 * exp(1j*2*pi*2*t)\n
% Time in seconds (NOT a discrete index).
t = 0:0.01:1;  % Time in seconds (NOT a discrete index).
x2 = 5 * exp(1j*2*pi*2*t); n0 = 1;

% Create time axis.
Time = 1:length(x2);  

% plot the complex sequence
clf
subplot(2,1,1)
stem(Time, real(x2), 'b'), xlabel('Index n (Showing Samples 0-100)');
ylabel('Sequence s[n]'); box('off'); title('Real Part');
axis([0 100 -5 5]); 

subplot(2,1,2)
stem(Time, imag(x2), 'b'), xlabel('Index n (Showing Samples 0-100)');
ylabel('Sequence s[n]'); box('off'); title('Imaginary Part');
axis([0 100 -5 5]);

% sequence operation
clear all
% Vectors must of same dimensions to perform element-wise addition, 
% subtraction, multiplication and division.
% Time in seconds (NOT a discrete index).
t = 0:0.01:1;  

% x1 = 5 * sin(2*pi*2*t)  x2 = 5 * cos(2*pi*2*t)
x1 = 5 * sin(2*pi*2*t); n0 = 1;
Time = 1:length(x1);
x2 = 5 * cos(2*pi*2*t); n0 = 1;

% plot x1
clf
subplot(3,2,1)
stem(Time, x1, 'b')
ylabel('Sequence'); box('off'); title('x1');
axis([0 100 -5 5]); 

% plot x2
subplot(3,2,2)
stem(Time, x2, 'b')
ylabel('Sequence'); box('off'); title('x2');
axis([0 100 -5 5]); 

% plot x1+x2
y = x1+x2;
subplot(3,2,3)
stem(Time, y, 'b')
ylabel('Sequence'); box('off'); title('x1 + x2');
axis([0 100 -10 10]); 

% plot x1-x2
y = x1-x2;
subplot(3,2,4)
stem(Time, y, 'b')
ylabel('Sequence'); box('off'); title('x1 - x2');
axis([0 100 -10 10]); 

% plot 3x1
y = 3*x1;
subplot(3,2,5)
stem(Time, y, 'b'), xlabel('Index n (Showing Samples 0-100)');
ylabel('Sequence'); box('off'); title('3 * x1');
axis([0 100 -15 15]); 

% plot pointwise multuplication of x1 and x2
y = x1 .* x2;
subplot(3,2,6)
stem(Time, y, 'b'), xlabel('Index n (Showing Samples 0-100)');
ylabel('Sequence'); box('off'); title('x1 .* x2');
axis([0 100 -25 25]); 

% time shift x = [2 4 6 3]
x = [2 4 6 3]
clf
subplot(3,1,1)
n0 = 1;
Time = ( 1:length(x) ) - n0;  % Create time axis.
stem(Time, x, 'b'), ylabel('Sequence x[n]'); box('off');
title('n0 = 1 (First vector element is at time zero.)');

% timeshift n0=2
subplot(3,1,2)
n0 = 2;
Time = ( 1:length(x) ) - n0;  % Create time axis.
stem(Time, x, 'b'), ylabel('Sequence x[n]'); box('off');
title('n0 = 2 (Second vector element is at time zero.)');

% timeshift n0=0
subplot(3,1,3)
n0 = 0;
Time = ( 1:length(x) ) - n0;  % Create time axis.
stem(Time, x, 'b'), xlabel('Index n'); ylabel('Sequence x[n]'); box('off');
title('n0 = 0 (Sample BEFORE first vector element is at time zero.)');


% Convolution
% MATLAB has a convolution function [conv()], but it assumes that each sequence is causal
% x = [1 2 3 4], h = [1 -1 1]
x = [1 2 3 4]; 
h = [1 -1 1];

% plot x
subplot(2,2,1)
stem( 0:length(x)-1, x, 'b'), ylabel('Sequence'), title('x'), box('off');

% plot h
subplot(2,2,2)
stem( 0:length(h)-1, h, 'b'), ylabel('Sequence'), title('h'), box('off');

% plot conv(x,h)
subplot(2,2,3)
x_h = conv(x, h);
stem( 0:length(x_h)-1, x_h, 'b'), ylabel('Sequence'), title('conv(x, h)')
xlabel('n'); box('off');

% plot conv(h,x)
subplot(2,2,4)
h_x = conv(h, x);
stem( 0:length(h_x)-1, h_x, 'b'), ylabel('Sequence'), title('conv(h, x)')
xlabel('n'); box('off');
% Output sequence length is: length(x) + length(h) - 1.
% Order of convolution does not matter.


% For sequences that don''t start at the first index, we can keep track of the signal origin.
% Let Tx, Th denote the element number of the "time = 0" sample, where Tx = 1 denotes the first element (MATLAB indexing)
% With this definition, the convolved sequence has its signal origin at "Tx + Th - 1".

% plot x
subplot(2,2,1)
stem( 0:length(x)-1, x, 'b'), ylabel('Sequence'), title('x, Tx=1'), box('off');

% plot h
subplot(2,2,2)
stem( 0:length(h)-1, h, 'b'), ylabel('Sequence'), title('h, Th=1'), box('off');

% plot conv when Tx = 1; Th = 2
subplot(2,2,3)
Tx = 1; Th = 2; x_h = conv(x, h);
n = 0:length(x_h)-1;  n = n - (Tx + Th - 2);
stem(n, x_h, 'b'), ylabel('Sequence')
title('conv(x, h), Tx=1, Th=2')
xlabel('n'); box('off');

% plot conv when Tx = 3; Th = 2
subplot(2,2,4)
Tx = 3; Th = 2; x_h = conv(x, h);
n = 0:length(x_h)-1;  n = n - (Tx + Th - 2);
stem(n, x_h, 'b'), ylabel('Sequence')
title('conv(x, h), Tx=3, Th=2')
xlabel('n'); box('off');

% Padding vectors with zeros should not change the result but can make the stem plots look nicer.

% x = [0 0 1 2 3 4 0 0], Tx = 3, h = [0 0 1 -1 1 0 0], Th = 3
x = [0 0 1 2 3 4 0 0]; 
h = [0 0 1 -1 1 0 0];
Tx = 3; 
Th = 3; 
x_h = conv(x, h);
n = 0:length(x_h)-1;  
n = n - (Tx + Th - 2);
clf, stem(n, x_h, 'b'), ylabel('Sequence')
title('conv(x, h), Tx=3, Th=3')
xlabel('n'); box('off');

% Now, let''s show that the order of linear systems does not matter
% x = [2 4 6 8], h1 = [-1 1], h2 = [3 6 -9]

x = [2 4 3 5]; 
h1 = [-1 1]; 
h2 = [3 6 -2];

% plot conv( conv(x, h1), h2)
subplot(2,1,1)
y1 = conv( conv(x, h1), h2);
stem( 0:length(y1)-1, y1, 'b'), ylabel('Sequence')
title('y1 = conv( conv(x, h1), h2)'); xlabel('n'); box('off');

% plot conv( conv(x, h2), h1)
subplot(2,1,2)
y2 = conv( conv(x, h2), h1);
stem( 0:length(y2)-1, y2, 'b'), ylabel('Sequence')
title('y2 = conv( conv(x, h2), h1)'); xlabel('n'); box('off');



return;