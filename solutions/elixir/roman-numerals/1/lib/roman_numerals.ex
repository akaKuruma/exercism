defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number)
  end

  defp convert(0), do: ""
  defp convert(4), do: "IV"
  defp convert(9), do: "IX"
  defp convert(num) when num < 4, do: "I" <> convert(num - 1)
  defp convert(num) when num < 9, do: "V" <> convert(num - 5)
  defp convert(num) when num < 40, do: "X" <> convert(num - 10)
  defp convert(num) when num < 50, do: "XL" <> convert(num - 40)
  defp convert(num) when num < 90, do: "L" <> convert(num - 50)
  defp convert(num) when num < 100, do: "XC" <> convert(num - 90)
  defp convert(num) when num < 400, do: "C" <> convert(num - 100)
  defp convert(num) when num < 500, do: "CD" <> convert(num - 400)
  defp convert(num) when num < 900, do: "D" <> convert(num - 500)
  defp convert(num) when num < 1000, do: "CM" <> convert(num - 900)
  defp convert(num) when num <= 3000, do: "M" <> convert(num - 1000)
end
