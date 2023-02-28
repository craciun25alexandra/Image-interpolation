==Proximal==
La 2x2, pentru aflarea lui x_int si a lui y_int am folosit "functia" a : b : c, ce
returneaza numerele de la a la c cu distanta dintre ele = b(echidistante de
lungime b). Apoi se parcurgea fiecare pixel si se incadra intr-unul dintre
sferturile date in imagine. Pt resize, s_x, respectiv s_y au luat valoarile date,
intrucat se lucra cu intervalele [0, n-1], [0, m-1]. Din acest motiv, cand se pune
in matrice, avem R(y+1, x+1), pentru a reveni la coordonatele initiale in imagine.
Fiecarui pixel ii este aplicata transformarea, inmultindu-se cu matricea de
transformare, este trecut la intervalul [1,n] prin adaugarea +[1,1], este 
aproximat, iar apoi trecut in imaginea finala. Coeficientii proximali au fost
calculati dupa formulele date in enunt, aplicandu-se A \ b pentru aflarea
solutiei de forma Ax=b.
La rotate, se aplica matricea de transformare corespunzatoare, se aproximeaza
punctele ce inconjoara pixelul transformat prin lipsa( pt marginea inferioara\
stanga), respectiv prin adaos( pentru dreapta), se calculeaza coeficientii
proximali prin apel la functie si se pune conform formulei pixelul in imaginea
finala.
Pentru RGB, am extras matricele, am apelat functia creata cu fiecare si le-am
concatenat.

==Bicubic==
Pentru calculul derivatelor am aflat marginile si am tratat caz separat pentru
ele, iar apoi am calculat derivatele conform formulelor date. Pentru coeficienti, am 
aplicat formulele date, iar pt resize, procedeul este asemanator cu proximalul,
aici verificand daca am intrecut marginile si aplicand coef proximali si formula
data pt pixelul final.

==Lanczos==
Am incercat sa transform pseudocodul dat in octave. Unde exista un for cu Vj,
Vj+1 (de ex), am lucrat cu V1 si V2, iar la finalul instructiunilor din for
fac schimbarea V1 = V2 pentru a actualiza valoarea(si am pastrat in alte
varibile daca aveam nevoie de valoarea lui Vj dupa executia forului). Pentru
functia de transfer am ignorat indicele s din formula data ^^.
