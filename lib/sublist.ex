defmodule Sublist do

  def compare(list_a, list_b) when length(list_a) < length(list_b) do
    check_sublist(list_a, list_b, list_a, list_b)
  end

  def compare(list_a, list_b) when length(list_a) > length(list_b) do
    case check_sublist(list_b, list_a, list_b, list_a) do
      :sublist -> :superlist
      result -> result
    end
  end

  def compare(list_a, list_b) do
    check_equality(list_a, list_b)
  end

  def check_sublist([], _list_b, _original_a, _original_b), do: :sublist
  def check_sublist(_list_a, [], _original_a, _original_b), do: :unequal
  def check_sublist([head_a | tail_a], [head_b | tail_b], original_a, original_b) when head_a === head_b do
    check_sublist(tail_a, tail_b, original_a, original_b)
  end
  def check_sublist(_list_a, _list_b, original_a, [_head | tail]) do
    check_sublist(original_a, tail, original_a, tail)
  end

  defp check_equality([], []), do: :equal
  defp check_equality([head_a | tail_a], [head_b | tail_b]) when head_a == head_b do
    check_equality(tail_a, tail_b)
  end
  defp check_equality(_, _), do: :unequal
end
