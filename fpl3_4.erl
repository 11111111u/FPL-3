-module(fpl3_4).
-export([task/2]).

task(JsonBin, proplist) when is_binary(JsonBin) ->
    case json_parse(JsonBin) of
        {ok, ParsedJson} -> proplist(ParsedJson);
        {error, _} -> {error, invalid_json}
    end;
task(JsonBin, map) when is_binary(JsonBin) ->
    case json_parse(JsonBin) of
        {ok, ParsedJson} -> map(ParsedJson);
        {error, _} -> {error, invalid_json}
    end.

% Парсинг json стрічки у структуровану форму
json_parse(JsonBin) ->
    try
        erl_json:task(JsonBin)
    catch
        _:Reason -> {error, Reason}
    end.

% Рекурсивно перетворює в proplist
proplist([]) -> [];
proplist([{Key, Value} | Rest]) ->
    [{Key, parse_value(Value)} | proplist(Rest)].

% Рекурсивно перетворює в map
map([]) -> #{};
map([{Key, Value} | Rest]) ->
    maps:put(Key, parse_value(Value), map(Rest)).

% Обробка різних типів значень в json
parse_value(Value) when is_list(Value) -> proplist(Value);
parse_value(Value) when is_tuple(Value) -> map(Value);
parse_value(Value) -> Value.
