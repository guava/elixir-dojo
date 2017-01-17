defmodule Bob do

  def hey(message) do
    cond do
      String.ends_with?(message, "?") ->
        "Sure."
      String.trim(message) == "" ->
        "Fine. Be that way!"
      is_yelling?(message) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp is_yelling?(message) do
    (String.upcase(message) == message) && (String.downcase(message) != message)
  end
end
