defmodule Sublist do

  def compare(list_a, list_b) when length(list_a) > length(list_b) do
    result = compare_sublist(list_b, list_a)

    if result == :sublist do
      :superlist
    else
      result
    end
  end

  def compare(list_a, list_b) when length(list_a) < length(list_b) do
    compare_sublist(list_a, list_b)
  end

  def compare(list_a, list_b) do
    check_equality(list_a, list_b)
  end

  def check_equality([], []), do: :equal

  def check_equality([head_a | []], [head_b | []]) when head_a !== head_b do
    :unequal
  end

  def check_equality([head_a | tail_a], [head_b | tail_b]) when head_a === head_b do
    check_equality(tail_a, tail_b)
  end

  defp compare_sublist([], _list_b), do: :sublist
  defp compare_sublist(_list_a, []), do: :unequal

  defp compare_sublist([head_a | tail_a], [head_b | tail_b]) when head_a === head_b do
    compare_sublist(tail_a, tail_b)
  end

  defp compare_sublist(list_a, [head_b | tail_b]) do
    compare_sublist(list_a, tail_b)
  end
end
