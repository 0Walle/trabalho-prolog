% a)
acrescentar([],X,[X]).
acrescentar([Y|YS],X,[Y|K]) :- acrescentar(YS,X,K).

% b)
inserir([],X,I,[X]).
inserir([Y|YS],X,1,[X,Y|YS]).
inserir([Y|YS],X,I,[Y|K]) :-
    I2 is I-1,
    inserir(YS,X,I2,K).

% c)
remover([], _, []).
remover([_ | YS], 1, YS).
remover([Y | YS], I, [Y | K]) :-
    I2 is I - 1,
    remover(YS, I2, K).

% d)
potencia(A,B,X) :-  X is A^B.

/*
Logica para e)

[] é palindromo
[X] é palindromo
[Y | YS] é palindromo se
  Y é ultimo de YS
  e tudo "antes do ultimo de YS" (o nome disso é init) é palindromo

Logica para ultimo (usado em e)

[] é o ultimo em []
Y é o ultimo em [Y]
o ultimo em [Y | YS] é o ultimo de YS

Logica para init (usado em e)

[] é o init em []
[] é o init em [Y]
o init em [Y | YS] é [Y | init de YS]
*/
