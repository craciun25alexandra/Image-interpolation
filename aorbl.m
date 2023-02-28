function [Am, Bm, Cm] = aorbl(A, B, C, sig1, sig2, tol)
  eps = 1;
  m =1;
  [n p] = size(B);
  H0 = I = eye(p)
  while (eps > tol)
    
    [Vm Wm] = rational(A, B, C);
    Am = Wm' * A * Vm;
    Bm = Wm' * B;
    Cm = C * Vm;
    % functia de transfer din enunt
    H1 = Cm * inv(eye(N) - Am) * Bm; 
    eps = norm(H0 - H1);
    H0 = H1;
    m++;
  endwhile
  
  endfunction