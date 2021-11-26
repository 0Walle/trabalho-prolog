
potencia(A,B,X) :-  X is A^B. %

acrescentar([],X,[X]).
acrescentar([Y|YS],X,[Y|K]) :- acrescentar(YS,X,K).

inserir([],X,I,[X]).
inserir([Y|YS],X,1,[X,Y|YS]).
inserir([Y|YS],X,I,[Y|K]) :-
    I2 is I-1,
    inserir(YS,X,I2,K).


