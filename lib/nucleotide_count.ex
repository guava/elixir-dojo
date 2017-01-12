defmodule NucleotideCount do
  # def count(dna, nucleotide) do
  #   List.foldl(dna, 0, fn(n, count) ->
  #     if n == nucleotide, do: count + 1, else: count
  #   end)
  # end

  def count(dna, nucleotide) do
    do_count(dna, nucleotide, 0)
  end

  defp do_count('', nucleotide, acc) do
    acc
  end

  defp do_count([head | tail], nucleotide, acc) when head == nucleotide do
    do_count(tail, nucleotide, acc + 1)
  end

  defp do_count([head | tail], nucleotide, acc) do
    do_count(tail, nucleotide, acc)
  end

  # def histogram(dna) do
  #   nucleotides = 'ATCG'
  #   List.foldl(nucleotides, %{}, fn(n, histogram) ->
  #     Map.put(histogram, n, count(dna, n))
  #   end)
  # end

  def histogram(dna) do
    do_histogram(dna, 'ATCG', %{})
  end

  def do_histogram(dna, [head | tail], histogram_map) do
    do_histogram(dna, tail, Map.put(histogram_map, head, count(dna, head)))
  end

  def do_histogram(dna, [], histogram_map) do
    histogram_map
  end
end
