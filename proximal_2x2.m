function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    % puncte de la 1 la 2, echidistante, cu distanta step
    x_int = 1: STEP: 2;
    y_int = 1: STEP: 2;
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    x1 = y1 = 1;
    x2 = y2 = 2;
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n);
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
      % daca este in a 2 a jumatate a lui x, este aproximat cu x2
      if x_int(i) >= (x1+x2)/2
              x = x2;
            else 
               x = x1;
              endif
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            % analog pt y
             if y_int(j) >= (y1+y2)/2
               y = y2;
             else y = y1;
             endif
            % TODO: Calculeaza pixelul din imaginea finala.
            % se ia pixelul din imag cu coordonatele aproximate
      out(i,j) = f(x, y);
        endfor
    endfor

endfunction