defmodule RunLengthEncoder do
  def encode("") do
    ""
  end

  def encode(str) do
    do_encode("", str, 0, encoded_str)
  end

  def do_encode(char, [head | tail], count, encoded_str) do
    if char == head do
      do_encode(head, tail, count+1, encoded_str)
    else
      do_encode(head, tail, 0, "#{encoded_str}#{count}#{char}")
    end
  end

  # falta caso base
end
