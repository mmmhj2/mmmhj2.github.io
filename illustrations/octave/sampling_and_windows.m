pkg load symbolic;
syms t w k;

T = 1;
n = 3;
interval = linspace(-50, 50, 5000);

dirac_series(t) = symsum(dirac(t - k*T/(2*n+1)), k, -n, n);
Dirac_series(w) = fourier(dirac_series);
db_dirac_series(w) = 20 * log10(abs(Dirac_series));
db_dirac_series_handle = function_handle(db_dirac_series);

blackman_series(t) = 0.42+ 0.5*cos(2*3.1415926*t/T) + 0.08*cos(4*3.1415926*t/T);
blackman_series = blackman_series * dirac_series;
Blackman_series(w) = fourier(blackman_series);
db_blackman_series(w) = 20 * log10(abs(Blackman_series));
db_blackman_series_handle = function_handle(db_blackman_series);

y_dirac = db_dirac_series_handle(interval);
y_blackman = db_blackman_series_handle(interval);

plot(interval, y_dirac, interval, y_blackman);
xlabel("Frequency");
ylabel("Attenuation (dB)");
legend("Rectangluar", "Blackman");

