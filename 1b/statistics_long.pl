% count_occurrences/3 counts the number of occurrences of an element in a list
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :-
    count_occurrences(X, T, N1),
    N is N1 + 1.
count_occurrences(X, [Y|T], N) :-
    X \= Y,
    count_occurrences(X, T, N).

% array_statistics/2 calculates the appearance statistics of each element in a list
array_statistics(Array, Stats) :-
    remove_duplicates(Array, Unique),
    array_statistics_helper(Unique, Array, Stats).

% Helper predicate for array_statistics/2
array_statistics_helper([], _, []).
array_statistics_helper([X|Unique], Array, [(X, Count)|Stats]) :-
    count_occurrences(X, Array, Count),
    array_statistics_helper(Unique, Array, Stats).

% Remove duplicates from a list
remove_duplicates([], []).
remove_duplicates([X|Xs], Unique) :-
    member(X, Xs),
    remove_duplicates(Xs, Unique).
remove_duplicates([X|Xs], [X|Unique]) :-
    \+ member(X, Xs),
    remove_duplicates(Xs, Unique).
