arco(a, b, 3).
arco(a, d, 5).
arco(b, d, 2).
arco(a, c, 4).
arco(d, c, 4).
arco(c, f, 5).
arco(d, e, 2).
arco(e, f, 2).

% X e Y são conectados se tem um arco X-Y ou Y-X.
conectado(X, Y, Custo) :- arco(X, Y, Custo) ; arco(Y, X, Custo).

% Qualquer coisa não é membro de uma lista vazia
nao_membro([], _).
% X não é membro de Y|YS se X \== Y e X não está em YS
nao_membro([Y | YS], X) :-
    X \== Y,
    nao_membro(YS, X).

% Caminho é caminho Origem->Final se tem caminho Origem->Final com
% Origem visitada
caminho(Origem, Final, Custo, Caminho) :-
    tem_caminho(Origem, Final, Custo, [Origem], Caminho).

% Tem um caminho N->Final se N está conectado ao Final
tem_caminho(N, Final, Custo, Visitados, [Final | Visitados]) :-
    conectado(N, Final, Custo).

% Tem um caminho N->Final se
%   tem um nó T conectado a N
%   T não é o Final
%   T não foi visitado
%   tem um caminho T->Final (com T visitado)
tem_caminho(N, Final, Custo, Visitados, Caminho) :-
    conectado(N, T, CustoAresta),
    T \== Final,
    nao_membro(Visitados, T),
    tem_caminho(T, Final, CustoRestante, [T | Visitados], Caminho),
    Custo is CustoAresta + CustoRestante.

% Um caminho A com custo X é melhor que um com custo Y se X for menor
% que Y
minpath([A, X], [_, Y], [A, X]) :- X < Y, !.
% ...caso contrario o outro caminho é melhor.
minpath(_, P, P).

minimal([Y | YS], Min) :- list_min(YS, Y, Min).

% Min é o menor numa lista vazia
list_min([], Min, Min).
% O menor entre o inicio da lista e PathB é o menor da lista se
% ele tambem for o menor no restante da lista
list_min([PathA | YS], PathB, Min) :-
    minpath(PathA, PathB, Z),
    list_min(YS, Z, Min).

% Caminho é caminho mais curto da Origem ao Final se
%     entre todos os caminhos X de Origem a Final
%     X é o menor deles
mais_curto(Origem, Final, Custo, Caminho) :-
    % findall/3:
    %     criar lista Todos para todo [Caminho, Custo] que é caminho Origem->Final
    findall([Caminho, Custo], caminho(Origem, Final, Custo, Caminho), Todos),
    minimal(Todos, [Caminho, Custo]).
