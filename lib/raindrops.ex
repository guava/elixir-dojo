defmodule Raindrops do
  def convert(number) do
    do_convert(number, [3, 5, 7], "")
  end

  defp do_convert(number, [head | tail], acc) when rem(number, head) == 0 do
    do_convert(number, tail, acc <> number_to_word(head))
  end
  defp do_convert(number, [_head | tail], acc) do
    do_convert(number, tail, acc)
  end
  defp do_convert(number, [], acc) do
    if String.length(acc) == 0 do
      "#{number}"
    else
      acc
    end
  end

  defp number_to_word(3) do
    "Pling"
  end
  defp number_to_word(5) do
    "Plang"
  end
  defp number_to_word(7) do
    "Plong"
  end
end
