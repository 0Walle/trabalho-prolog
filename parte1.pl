% == Predicado a) ==
% X no fim de [] é [X]
acrescentar([],X,[X]).
% X no fim de [Y|YS] é [Y | X no fim de YS]
acrescentar([Y|YS],X,[Y|K]) :- acrescentar(YS,X,K).

% == Predicado b) ==
% X em qualquer index de [] é [X]
inserir([],X,_,[X]).
% X no index 1 de [Y|YS] é [X,Y|YS]
inserir([Y|YS],X,1,[X,Y|YS]).
% X no index I de [Y|YS] é [Y| X no index I-1 de YS]
inserir([Y|YS],X,I,[Y|K]) :-
    I2 is I-1,
    inserir(YS,X,I2,K).

% == Predicado c) ==
% [] sem qualquer index é []
remover([], _, []).
% [Y|YS] sem o index 1 é YS
remover([_ | YS], 1, YS).
% [Y|YS] sem o index I é [Y|YS sem index I-1]
remover([Y | YS], I, [Y | K]) :-
    I2 is I - 1,
    remover(YS, I2, K).

% == Predicado d) ==
% X é A elevado a B
potencia(A,B,X) :-  X is A^B.

% == Predicado e) ==
% [] é palindromo
palindromo([]).
% [X] é palindromo
palindromo([_]).
% [Y|YS] é palindromo se
%    primeiro e ultimo de YS são iguais
%    o restante de YS tambem é palindromo
palindromo([Y | YS]) :-
    ultimo(YS,Y),
    restante(YS, I),
    palindromo(I).


% == Auxiliares da e) ==
% ultimo de [] é []
ultimo([],[]).
% ultimo de [Y] é Y
ultimo([Y],Y).
% ultimo de [Y|YS] é o ultimo de YS
ultimo([_ | YS], S) :- ultimo(YS, S).

% restante de [] é []
restante([],[]).
% restante de [Y] é []
restante([_],[]).
% restante de [Y|YS] é [Y|restante de YS]
restante([Y | YS],[Y|S]) :- restante(YS, S).
