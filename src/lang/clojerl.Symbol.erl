-module('clojerl.Symbol').

-export([
         new/1,
         new/2,
         namespace/1,
         is/1
        ]).

-type type() :: {?MODULE, #{ns => binary() | undefined,
                            name => binary()}}.

-spec new(binary()) -> type().
new(Name) when is_binary(Name) ->
  new(undefined, Name).

-spec new(binary() | undefined, binary()) -> type().
new(Namespace, Name) when is_binary(Namespace) orelse Namespace == undefined,
                          is_binary(Name) ->
  {?MODULE, #{ns => Namespace, name => Name}}.

-spec namespace(type()) -> binary() | undefined.
namespace({?MODULE, #{ns := Ns}}) ->
  Ns.

-spec is(any()) -> boolean().
is(X) -> clj_core:type(X) == ?MODULE.