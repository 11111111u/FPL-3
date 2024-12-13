-module(fpl3_2).
-export([task/1]).

%% Функція для розділення бінарного рядка на слова
-spec task(binary()) -> [binary()].
task(BinText) ->
    %% Перетворює бінарний рядок у список символів
    CharList = binary_to_list(BinText),
    %% Розділяє список на слова за допомогою пробілу як роздільника
    WordList = string:tokens(CharList, " "),
    %% Перетворює кожне слово назад у бінарний рядок
    lists:map(fun list_to_binary/1, WordList).




