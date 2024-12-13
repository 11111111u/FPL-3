-module(fpl3_1).
-export([task/1]).

task(BinText) ->
    % Виклик допоміжної функції з початковим порожнім акумулятором
    task(BinText, <<>>).

task(<<>>, Acc) -> 
    % Якщо рядок закінчився, повертає слово
    Acc;
task(<<Char, _Rest/binary>>, Acc) when Char == 32 ->
    % Якщо зустрівся пробіл, завершує збирання слова
    Acc;
task(<<Char, Rest/binary>>, Acc) ->
    task(Rest, <<Acc/binary, Char>>).