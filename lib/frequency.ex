defmodule Frequency do
  def frequency([], _workers) do
    %{}
  end

  def frequency(texts, workers) do
    worker_loads = texts
      |> Enum.with_index
      |> Enum.chunk_by(fn({element, index}) -> rem(index, workers) end)
      |> Enum.map(
        fn(list) ->
          Enum.map(list, fn({e, _i}) ->
            e
          end)
        end)

    worker_loads
    |> Enum.map(fn(load) ->
      Task.async(fn ->
        do_frequency(Enum.join(load), %{})
      end)
    end)
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(fn(map, acc) ->
      Map.merge(map, acc, fn(_k, v1, v2) ->
        v1 + v2
      end)
    end)
  end

  defp do_frequency(nil, acc), do: acc

  defp do_frequency(text, acc) when is_binary(text) do
    text
    |> String.downcase
    |> String.replace(~r/[:!&@$%, 0-9^]/ , "")
    |> String.graphemes
    |> do_frequency(acc)
  end

  defp do_frequency([head | tail], acc) do
    {_, updated_acc} = Map.get_and_update(acc, head, fn(value) ->
      if value == nil, do: {value, 1}, else: {value, value + 1}
    end)

    do_frequency(tail, updated_acc)
  end

  defp do_frequency([], acc) do
    acc
  end
end
