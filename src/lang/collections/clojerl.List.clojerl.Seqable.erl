-module('clojerl.List.clojerl.Seqable').

-behaviour('clojerl.Seqable').

-export([seq/1]).

seq({_, [], _}) -> undefined;
seq(List) -> List.
