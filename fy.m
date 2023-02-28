function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    % aflu marginile pt a le verifica separat
    [m n nr_colors] = size(f);
     % verific marginile
    if (y - 1 < 1 || y + 1 > m)
      r = 0;
      return;
    endif
    % aplic formula
    r = (f(y + 1, x)- f(y - 1, x)) / 2;
endfunction