defmodule Nineteen do
  def part_one(input) do
    input
    |> parse()
  end

  def part_two(input) do
    input
    |> parse()
  end

  defp parse(text) do
    text
    # |> String.split("\n")
    # |> Enum.map(&String.to_integer/1)
  end
end

input = File.read!("input/19.txt")

input
|> Nineteen.part_one()
|> IO.inspect()

# input
# |> Nineteen.part_two()
# |> IO.inspect()
