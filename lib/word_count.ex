defmodule Words do
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[:!&@$%,^]/ , "")
    |> String.split(~r/\s|_/, trim: true)
    |> List.foldl(%{}, fn(x, acc) ->
      Map.put(acc, x, Map.get(acc, x, 0) + 1)
    end)
  end
end
