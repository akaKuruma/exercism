defmodule Bob do
  def hey(input) do
    cond do
      saying_anything?(input) -> "Fine. Be that way!"
      yelling_question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      asking?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp saying_anything?(input), do: String.trim(input) == ""

  defp has_letters?(input),
    do: Regex.scan(~r/[[:alpha:]]/u, input) |> List.flatten() |> Enum.empty?() |> Kernel.!()

  defp yelling?(input), do: has_letters?(input) && input == String.upcase(input)
  defp asking?(input), do: input |> String.trim() |> String.ends_with?("?")
  defp yelling_question?(input), do: yelling?(input) && asking?(input)
end
