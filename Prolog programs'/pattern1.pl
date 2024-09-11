% Rule: match(X, Y) - succeeds if X is equal to Y
match(X, Y) :-
    X = Y,
    format('The inputs ~w and ~w are equal.~n', [X, Y]).

match(X, Y) :-
    X \= Y,
    format('The inputs ~w and ~w are not equal.~n', [X, Y]).
