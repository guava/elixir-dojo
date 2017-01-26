defmodule Acronym do
  # def abbreviate(phrase) do
  #   phrase
  #   |> String.replace(~r/([A-Z])/, " \\1")
  #   |> String.split
  #   |> Enum.map(&to_char_list/1)
  #   |> Enum.map(&List.first/1)
  #   |> to_string
  #   |> String.upcase
  # end

  def abbreviate(phrase) do
    phrase
    |> String.split
    |> abbreviate_list
    |> Enum.join
  end

  defp abbreviate_list([]) do
    []
  end

  defp abbreviate_list([head | tail]) do
    [abbreviate_word(head) | abbreviate_list(tail)]
  end

  defp abbreviate_word(word) do
    first_upcase_letter =
      word
      |> String.first
      |> String.capitalize

    other_upcase_letters =
      word
      |> String.slice(1..-1)
      |> String.replace(~r/[^A-Z]/, "")

    [first_upcase_letter, other_upcase_letters]
  end
end
