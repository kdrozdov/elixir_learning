-module(utils).
-export([factorial/1, print/1, is_even/1, filter/2]).

factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).

print([]) ->
  io:format("~n");
print([X|Xs]) ->
  io:format("~p\t", [X]),
  print(Xs).

% filter(_, []) ->
%   [];
% filter(P, [X|Xs]) ->
%   case(P(X)) of
%     true -> [X|filter(P, Xs)];
%     _ -> filter(P, Xs)
%   end.

filter(P, Xs) -> [X || X <- Xs, P(X)].

is_even(X) ->
  X rem 2 == 0.
