function a = proximal_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii a pentru Interpolarea Proximala intre punctele
    % (x1, y1), (x1, y2), (x2, y1) si (x2, y2).
    % =========================================================================
    
    % TODO: Calculeaza matricea A.
  
    A = zeros(4,4);
    
    A(1:4,1) = 1;
    
    A(1:2,2) = x1;
    A(3:4,2) = x2;
    
    A(1,3) = y1;
    A(2,3) = y2;
    A(3,3) = y1;
    A(4,3) = y2;
    
    A(1,4) = x1*y1;
    A(2,4) = x1*y2;
    A(3,4) = x2*y1;
    A(4,4) = x2*y2;
    
    % TODO: calculeaza vectorul b
        b = zeros(4,1);
        
    b = [f(y1,x1); f(y2,x1); f(y1,x2); f(y2,x2)];
    b = double(b);
    % TODO: calculeaza coeficientii
    % pt a rezolva A * a = b ( a = A^-1 * b)
    a = A \ b;
   

    
endfunction
