defmodule Sublist do
  def compare([], []), do: :equal
  def compare([], list_b), do: :sublist
  def compare(list_a, []), do: :superlist

  def compare([head_a | []], [head_b | []]) when head_a != head_b do
    :unequal
  end

  def compare([head_a | tail_a], [head_b | tail_b]) when head_a == head_b do
    compare(tail_a, tail_b)
  end

  def compare(list_a, [head_b | tail_b]) do
    compare(list_a, tail_b)
  end
end
