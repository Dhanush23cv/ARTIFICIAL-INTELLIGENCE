% Base case: Empty pattern matches an empty list
match([], []).

% Variable in the pattern can match any element in the list
match([_ | PatternTail], [_ | ListTail]) :-
    match(PatternTail, ListTail).

% Exact match: Both elements in the pattern and list are the same
match([Element | PatternTail], [Element | ListTail]) :-
    match(PatternTail, ListTail).

% Example query: match([a, _, c], [a, b, c]).
