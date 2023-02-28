function [V_rez W_rez] = rational (A, B, C, sigma)
  
  [n, n] = sizeof(A);
  I = eye(n);
  S0 = inv(A - sigma(1) * I) * B;
  R0 = ((A - sigma(1) * I)')*C';
  [V1 H1] = qr(S0);
  [W1 G1] = qr(R0);
  V_rez = V1;
  W_rez = W1;
  % nu stiu m ul pt for
  m = size(sigma);
  for k = 1 : m
    
  if k < m
    if sigma(k+1) == Inf
      S1 = A * V1;
      R1 = A' * W1;
    else
      S1 = inv((A - sigma(k+1) * I)) * V1;
      R1 = inv((A - sigma(k+1) * I)) * W1;
    endif
    H1 = W_rez' * S1;
    G1 = V_rez' * R1;
    S1 = S1 - V_rez * H1;
    R1 = R1 - W_rez * G1;
    [V2 H2] = qr(S1);
    [W2 G2] = qr(R1);
    [P1 D1 Q1'] = svd(W2' * V2);
    V2 = V2 * Q1 * inv(sqrt(D1));
    W2 = W2 * P1 * inv(sqrt(D1));
    H2 = sqrt(D1) * Q1' * H2;
    G2 = sqrt(D1) * P1' * G2;
    V_rez = [V_rez V2];
    W_rez = [W_rez W2];
    % actualizare pt pasul urmator
    V1 = V2;
    W1 = W2;
    G1 = G2;
    H1 = H2;
  else
    if sigma(m+1) == Inf
      Sm = A * B;
      Rm = A' *C;
    else
      Sm = inv(A) * B;
      Rm = inv(A') * C'; 
    endif
    Hm = W_rez' * Sm;
    Gm = V_rez' * Rm;
    Sm = Sm - V_rez * Hm;
    Rm = Rm - W_rez * Gm;
    [Vm2 Hm2] = qr(Sm);
    [Wm2 Gm2] = qr(Rm);
    [Pm Dm Qm'] = svd(Wm2' * Vm2];
    Vm2 = Vm2 * Qm * inv(sqrt(Dm));
    Wm2 = Wm2 * Pm * inv(sqrt(Dm));
    Hm2 = sqrt(Dm) * Qm' * Hm2;
    Gm2 = sqrt(Dm) * Pm' * Gm2;
    V_rez = [V_rez, Vm2];
    W_rez = [W_rez, Wm2];
    endif
  endfor
  endfunction