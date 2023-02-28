function [V_rez W_rez] = langos(A, V, W, m)
  
  B = W' * V;
  [g b] = qr(B);
  V1 = V * inv(b);
  W1 = W * g;
  V2_tilda = A * V1;
  W2_tilda = A' * W1;
  for j = 1:m
    a = W1' * V2_tilda;
    V2_tilda = V2_tilda - V1 * a;
    W2_tilda = W2_tilda - W1 *a';
    [V2 b] = qr(V2_tilda);
    [W2 g'] = qr(W2_tilda);
    [U S Z'] = svd(W2' * V2);
    g = g * U * sqrt(S);
    b = sqrt(S) * Z' * b;
    V2 = V2 * Z * sqrt(inv(S));
    W2 = W2 * U * sqrt(inv(S));
    V2_tilda = A * V2 - V1 * g;
    W2_tilda = A' * W2 - W1 * b';
    % se pastreaza aceste valori in rez, deoarece V1 si W1 urmeaza sa fie
    % actualizate pt pasul urmator
    V_rez = V1;
    W_rez = W1;
    % cum W1 = Wj, W1 = W2 pentru pasul urmator, unde se foloseste W1
    % analog pt V1 
    W1 = W2;
    V1 = V2; 
  endfor
  endfunction