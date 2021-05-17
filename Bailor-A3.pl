% Class: CMSC 471-01 FA2020
% Author: Sam Bailor
% Program-1: Course Registration

%/--------------/
% Facts:
% teaches(X, Y) means professor X teaches course Y
teaches(fred, cmsc471).
teaches(fred, cmsc478).
teaches(fred, cmsc491).
teaches(tim, cmsc671).

% studies(X, Y) means student X studies course Y
studies(michelle, cmsc471).
studies(michelle, cmsc478).
studies(john, cmsc471).
studies(joe, cmsc491).
studies(mary, cmsc671).

% required(X, Y) means course X is required for course Y
required(cmsc341, cmsc471).
required(cmsc471, cmsc671).
required(stat355, cmsc478).
required(cmsc478, cmsc491).
required(cmsc491, cmsc691).

%/--------------/
% Rules:
% Rule-1 [25 points] professor(X, Y): Using the facts teaches() and studies(),
% write a rule that defines professor(X, Y) such that X is a professor who teaches a course that student Y studies.
% For example, professor(fred, michelle) is true.
professor(X, Y):- teaches(X, Z), studies(Y, Z).

% Rule-2 [25 points] prerequisite(X, Y): Using the required() facts,
% write a recursive rule that defines prerequisite(X, Y) such that course X is directly or indirectly required for course Y.
% For example, stat355 is a prerequisite for cmsc478, cmsc491 and cmsc691
% Hint: This must be a recursive rule with two lines of code (base case and recursion).
% Non-recursive solutions will get zero points.
prerequisite(X, Y):- required(X, Y).
prerequisite(X, Y):- required(X, Z), prerequisite(Z, Y).

%/--------------/
% Queries:
% Once you complete the rules, run the following queries to test your rules.
% You don't need to include the queries or the results in your answer file.
% The query results for Program-1 are intentionally NOT provided,
% so you should NOT share the results of the queries in Piazza!
% ?- professor(X, Y).
% ?- prerequisite(X, Y).

%/------------------------------------------------------------/
% Program-2: List Operations

% Rule-3 [25 points] Find the last element of a list.
% last_element(L, X) X is the last element of list L
% For example, last_element([1,2,3], LE) returns LE = 3
% The last element of an empty list is undefined (returns false).
% Hint-1: You should NOT get "Singleton variables: " message when you run the query.
% Hint-2: The base case is NOT an empty list!
last_element([LE], LE).
last_element([_ | List], LE) :- last_element(List, LE).

% Rule-4 [25 points] Compute the product of the squared elements of a list.
% Square each element and then multiply all squared elements in a given list.
% product_squared(L, P) where L is the list and P is the result
% For example, the product of the squared elements of the list [1, 2, 3] is 1*4*9=36,
% product_squared([1,2,3], P) returns P = 36
% The product_squared of an empty list is undefined (returns false).
% Hint-1: You can express the equality in arithmetic expressions using "is", e.g.: 6 is 2*3
% Hint-2: You should NOT get "Singleton variables: " message when you run the query.
% Hint-3: The base case is NOT an empty list!
product_squared([P], P*P).
product_squared([H|T], P) :- product_squared(T, P1), P is P1 * H * H.

% Queries:
% Once you complete the rules, run the following queries to test your rules:
% ?- last_element([], LE). % returns false
% ?- last_element([1,2,3], LE). % returns LE=3
% ?- product_squared([1,2,3], P). % returns P=36
% ?- product_squared([2,4,6], P). % returns P=2304
% ?- product_squared([1,2,3,0], P). % returns P=0
% ?- product_squared([], P). % returns false