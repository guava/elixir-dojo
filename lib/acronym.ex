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
    Enum.join(abbreviate_list(String.split(phrase)))
  end

  defp abbreviate_list([]) do
    []
  end

  defp abbreviate_list([head | tail]) do
    [abbreviate_word(head) | abbreviate_list(tail)]
  end

  defp abbreviate_word(word) do
    word
    |> String.capitalize
    |> String.replace(~r/[a-z]/, "")
  end
end
