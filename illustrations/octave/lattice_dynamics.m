1;

function omega = acoustic_mode(q, Omega_s, Omega_l)
  omega = sqrt(
      Omega_s ^ 2 + Omega_l ^ 2
      - sqrt(Omega_s^4 + Omega_l^4 + 2 * Omega_s^2 * Omega_l ^ 2 * cos(q))
    );
endfunction

function omega = optical_mode(q, Omega_s, Omega_l)
  omega = sqrt(
      Omega_s ^ 2 + Omega_l ^ 2
      + sqrt(Omega_s^4 + Omega_l^4 + 2 * Omega_s^2 * Omega_l ^ 2 * cos(q))
    );
endfunction

Omega_s = 2;
Omega_l = 3;
q = linspace(-2 * pi, 2 * pi, 500);
a = acoustic_mode(q, Omega_s, Omega_l);
p = optical_mode(q, Omega_s, Omega_l);

h = figure;
plot(q, a, q, p);
xlim([-2 * pi, 2 * pi]);
legend('声学支', '光学支', 'fontname', 'SimSun');
print(h, '1d-phonon-modes.png', '-color');

