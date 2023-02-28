function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    aux1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    aux3 = [1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    aux2 = zeros(4, 4);
    aux2(:, 1) = [f(y1, x1) f(y1, x2) Ix(y1, x1) Ix(y1, x2)];
    aux2(:, 2) = [f(y2, x1) f(y2, x2) Ix(y2, x1) Ix(y2, x2)];
    aux2(:, 3) = [Iy(y1, x1) Iy(y1, x2) Ixy(y1, x1) Ixy(y1, x2)];
    aux2(:, 4) = [Iy(y2, x1) Iy(y2, x2) Ixy(y2, x1) Ixy(y2, x2)];
    % TODO: Converte?te matricile intermediare la double.
    aux1 = cast(aux1, 'double');
    aux2 = cast(aux2, 'double');
    aux3 = cast(aux3, 'double');
    % TODO: Calculeaz? matricea final?.
    % am aplicat formula
    A = aux1 * aux2 * aux3;

endfunction