function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
    % aflu marginile pentru a le verifica separat
    [m n nr_colors] = size(f);
    % iau in considerare marginile
    if (x  - 1 < 1 || x + 1 > n)
      r = 0;
      return;
    endif
    % aplic formula
     r = (f(y, x + 1) - f(y, x - 1)) / 2;
endfunction