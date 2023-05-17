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
isFinal(State, FinalStates) :- member(State, FinalStates).

% Перевірка, чи можливо зробити K переходів
rec(K) :- startState(Start), alfabet(Alfa), finalState(F), rec1(K, Start, Alfa, F).

% Базовий випадок для рекурсії, коли не залишилось жодних символів для переходу
rec1(_, _, [], _).

% Базовий випадок для рекурсії, коли K станів і K символів перевірено
rec1(0, State, _, F) :- isFinal(State, F), !.
rec1(0, _, [], _).

% Рекурсивний випадок для перевірки можливості K переходів
rec1(K, State, [H|Alfabet], F) :-
    K > 0,
    transition(State, H, Q1),
    K1 is K-1,
    rec1(K, State, Alfabet, F),
    rec1(K1, Q1, Alfa, F).
