+clc;
clear;

% Class intervals
lower = [0 10 20 30 40];
upper = [10 20 30 40 50];

% Frequencies
f = [5 8 12 7 3];

% Calculate class midpoints
x = (lower + upper) / 2;

% Mean of grouped data
N = sum(f);
Mean = sum(f .* x) / N;

% Median of grouped data
cf = cumsum(f);
i = find(cf >= N/2, 1);

L = lower(i);
h = upper(i) - lower(i);

if i == 1
    cf_previous = 0;
else
    cf_previous = cf(i-1);
end

Median = L + ((N/2 - cf_previous) / f(i)) * h;

% Mode of grouped data
[~, i] = max(f);

L = lower(i);
h = upper(i) - lower(i);

if i == 1
    f_previous = 0;
else
    f_previous = f(i-1);
end

if i == length(f)
    f_next = 0;
else
    f_next = f(i+1);
end

Mode = L + ((f(i) - f_previous) / ...
    (2*f(i) - f_previous - f_next)) * h;

% Display results
fprintf('Mean = %.2f\n', Mean);
fprintf('Median = %.2f\n', Median);
fprintf('Mode = %.2f\n', Mode);
