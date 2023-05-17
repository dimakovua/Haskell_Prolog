% remove_n_smallest/3 removes the N smallest elements from Array and returns the result in Result
remove_n_smallest(Array, N, Result) :-
    % Determine the length of Array
    length(Array, Length),
    % Check if N is less than or equal to Length
    N =< Length,
    % Sort the elements of Array in ascending order
    insertion_sort(Array, Sorted),
    % Take the first N elements of Sorted and store them in Smallest
    take_n(Sorted, N, Smallest),
    % Remove the elements of Smallest from Array and store the result in Result
    subtract_list(Array, Smallest, Result).

% insertion_sort/2 sorts the elements of List in ascending order using the insertion sort algorithm
insertion_sort(List, Sorted) :-
    insertion_sort(List, [], Sorted).

% insertion_sort/3 is the helper predicate for insertion_sort/2
insertion_sort([], Acc, Acc).
insertion_sort([X|Xs], Acc, Sorted) :-
    insert(X, Acc, NewAcc),
    insertion_sort(Xs, NewAcc, Sorted).

% insert/3 inserts an element X into the correct position in a sorted list Acc and returns the updated list in NewAcc
insert(X, [], [X]).
insert(X, [Y|Ys], [X,Y|Ys]) :- X =< Y.
insert(X, [Y|Ys], [Y|Zs]) :- X > Y, insert(X, Ys, Zs).

% take_n/3 creates a list of the first N elements of List and stores the result in Result
take_n(_, 0, []).
take_n([X|Xs], N, [X|Result]) :-
    N > 0,
    N1 is N - 1,
    take_n(Xs, N1, Result).

% subtract_list/3 removes any elements in Ys from [X|Xs] and stores the result in Result
subtract_list([], _, []).
subtract_list([X|Xs], Ys, Result) :-
    member_custom(X, Ys),
    subtract_list(Xs, Ys, Result).
subtract_list([X|Xs], Ys, [X|Result]) :-
    \+ member_custom(X, Ys),
    subtract_list(Xs, Ys, Result).

% member_custom/2 checks if X is a member of List
member_custom(X, [X|_]).
member_custom(X, [_|Tail]) :- member_custom(X, Tail).
