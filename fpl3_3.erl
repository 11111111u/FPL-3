-module(fpl3_3).
-export([split/2]).

%% Розділити рядок на частини, з явною вказівкою роздільника:
-spec split(binary(), binary()) -> [binary()].
split(BinText, Delim) ->
    %% Перетворює бінарний рядок у список символів
    CharList = binary_to_list(BinText),
    %% Перетворє роздільник в список символів
    DelimList = binary_to_list(Delim),
    %% Розділяє список на частини за допомогою роздільника
    PartList = string:tokens(CharList, DelimList),
    %% Перетворює кожну частину назад у бінарний рядок
    lists:map(fun list_to_binary/1, PartList).

