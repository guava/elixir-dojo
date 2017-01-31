defmodule RunLengthEncoder do
  def encode("") do
    ""
  end

  def encode(str) when is_binary(str) do
    str
    |> to_char_list
    |> encode
  end

  def encode([head | tail]) do
    do_encode(head, tail, 1, "")
  end

  defp do_encode(char, [head | tail], count, encoded_str) when char == head do
    do_encode(head, tail, count+1, encoded_str)
  end

  defp do_encode(char, [head | tail], count, encoded_str) do
    do_encode(head, tail, 1, "#{encoded_str}#{count}#{<< char >>}")
  end

  defp do_encode(_char, [], count, encoded_str) when count == 0 do
    encoded_str
  end

  defp do_encode(char, [], count, encoded_str) do
    "#{encoded_str}#{count}#{<< char >>}"
  end

  def decode(encoded_str) when is_binary(encoded_str) do
    encoded_str
    |> to_char_list
    |> decode
  end

  def decode([head | tail]) do
    do_decode(head, tail, '', "")
  end

  ####                                             ####
  ## TEM MELHORIA                                    ##
  ## Usar Integer.parse pra fazer o decode           ##
  ## Vai evitar verificar se o próximo char é número ##
  ## GOSTAMOS!                                       ##
  ####                                             ####

  defp do_decode(char, [head | tail], seen, decoded_str) do
    if char >= ?0 && char <= ?9 do
      do_decode(head, tail, "#{seen}#{<< char >>}", decoded_str)
    else
      new = List.duplicate([char], String.to_integer(seen))
      do_decode(head, tail, '', "#{decoded_str}#{new}")
    end
  end

  defp do_decode(char, [], seen, decoded_str) do
    if Integer.parse(seen) >= 0 do
      new = List.duplicate([char], String.to_integer(seen))
      "#{decoded_str}#{new}"
    else
      decoded_str
    end
  end
end
