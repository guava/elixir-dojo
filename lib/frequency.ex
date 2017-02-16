defmodule Frequency do
  def frequency([], _workers) do
    %{}
  end

  def frequency(texts, workers) do
    Agent.start(fn -> %{} end, name: __MODULE__)

    divide_work(texts, workers)
    |> Enum.map(fn(load) ->
      Task.async(fn ->
        do_frequency(Enum.join(load))
      end)
    end)
    |> Enum.map(&Task.await/1)

    final_frequency = Agent.get(__MODULE__, fn(state) -> state end)
    Agent.stop(__MODULE__)
    final_frequency
  end

  defp do_frequency(text) when is_binary(text) do
    text
    |> String.downcase
    |> String.replace(~r/[:!&@$%, 0-9^]/ , "")
    |> String.graphemes
    |> do_frequency
  end

  defp do_frequency([head | tail]) do
    Agent.update(__MODULE__, fn(agent_data) ->
      Map.update(agent_data, head, 1, fn(value) ->
        value + 1
      end)
    end)

    do_frequency(tail)
  end

  defp do_frequency([]), do: nil
  defp do_frequency(nil), do: nil

  defp divide_work(texts, workers) do
    work_size = round(Enum.count(texts) / workers) + 1
    Enum.chunk(texts, work_size, work_size, [])
  end
end
