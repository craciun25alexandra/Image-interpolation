function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    % aflu marginile pt a le verifica separat 
    [m n nr_colors] = size(f);
    % iau in considerare marginile
    if (x -1 < 1 || x + 1 > n)
      r = 0;
      return;
    endif
    
    if (y -1 < 1 || y + 1 > m)
      r = 0;
      return;
    endif
    % aplic formula
    r = (f(y + 1, x + 1) + f(y - 1, x - 1) - f(y - 1, x + 1) - f(y + 1, x - 1) ) / 4;
endfunction