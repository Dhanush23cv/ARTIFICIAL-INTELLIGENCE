% Define the heuristic function (estimate to reach the goal)
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 2).
heuristic(d, 1).
heuristic(e, 0).  % Goal node

% Define the edges of the graph (Node1, Node2, Cost)
edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(c, d, 5).
edge(d, e, 1).

% Best First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search([(Start, 0)], Goal, [], Path).

% Base case: Goal found
best_first_search([(Goal, _)|_], Goal, Visited, Path) :-
    reverse([Goal|Visited], Path), !.

% Recursive case: Expand the current node
best_first_search([(Current, _)|RestOpen], Goal, Visited, Path) :-
    findall((Next, H), (edge(Current, Next, _), \+ member(Next, Visited), heuristic(Next, H)), Neighbors),
    append(RestOpen, Neighbors, NewOpenList),
    sort_open_list(NewOpenList, SortedOpenList),
    best_first_search(SortedOpenList, Goal, [Current|Visited], Path).

% Helper predicate to sort open list based on heuristic value
sort_open_list(OpenList, SortedOpenList) :-
    sort(2, @=<, OpenList, SortedOpenList).

% Example query to find the path from a to e
% ?- best_first_search(a, e, Path).
