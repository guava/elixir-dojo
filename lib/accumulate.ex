defmodule Accumulate do

  def accumulate(array, fun) do
    do_accumulate(array, fun, [])
  end

  defp do_accumulate([head | tail], fun, acc) do
    do_accumulate(tail, fun, [fun.(head) | acc])
  end

  defp do_accumulate([], _, acc) do
    Enum.reverse(acc)
  end
end
