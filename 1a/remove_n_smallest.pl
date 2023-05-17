% remove_n_smallest/3 removes the N smallest elements from Array and returns the result in Result
remove_n_smallest(Array, N, Result) :-
    % Determine the length of Array
    length(Array, Length),
    % Check if N is less than or equal to Length
    N =< Length,
    % Sort the elements of Array in ascending order
    sort(Array, Sorted),
    % Take the first N elements of Sorted and store them in Smallest
    take_n(Sorted, N, Smallest),
    % Remove the elements of Smallest from Array and store the result in Result
    subtract(Array, Smallest, Result).

% take_n/3 creates a list of the first N elements of List and stores the result in Result
take_n(List, N, Result) :-
    % Create a list of length N and store it in Result
    length(Result, N),
    % Append any suffix of List to Result (i.e., ignore the suffix)
    append(Result, _, List).

% Base case for subtract/3: the empty list minus anything is the empty list
subtract([], _, []).

% subtract/3 removes any elements in Ys from [X|Xs] and stores the result in Result
subtract([X|Xs], Ys, Result) :-
    % If X is a member of Ys, skip X and call subtract/3 recursively with the remaining elements
    member(X, Ys),
    subtract(Xs, Ys, Result).
    
% If X is not a member of Ys, add X to the head of Result and call subtract/3 recursively with the remaining elements
subtract([X|Xs], Ys, [X|Result]) :-
    \+ member(X, Ys),
    subtract(Xs, Ys, Result).
