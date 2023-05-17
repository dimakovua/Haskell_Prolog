% Визначення алфавіту
alfabet([a, b]).

% Визначення переходів між станами автомата
transition(q0, a, q1).
transition(q0, b, q2).
transition(q1, a, q3).
transition(q1, b, q1).
transition(q2, a, q2).
transition(q2, b, q3).

% Визначення початкового стану
startState(q0).

% Визначення кінцевих станів
finalState([q1, q2]).

% Перевірка, чи допускає автомат заданий стан
isFinal(State) :- finalState(F), member(State, F).

% Перевірка, чи можливо зробити K переходів
rec(K) :- startState(Start), alfabet(Alfa), rec1(K, Start, Alfa).

% Базовий випадок для рекурсії, коли не залишилось жодних символів для переходу
rec1(_, _, []).

% Базовий випадок для рекурсії, коли K станів і K символів перевірено
rec1(0, _, []) :- !.

% Рекурсивний випадок для перевірки можливості K переходів
rec1(K, State, [H|Alfabet]) :-
    K > 0,
    alfabet(Alfa),
    transition(State, H, Q1),
    K1 is K-1,
    rec1(K, State, Alfabet),
    rec1(K1, Q1, Alfa);
    isFinal(State).
