defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([" : ", ",", " ", "_"])
    |> select_words()
    |> Enum.frequencies()
  end

  defp select_words(sentence),
    do: sentence |> Enum.map(fn word -> Regex.scan(~r/[\w|-]+/u, word) end) |> List.flatten()
end
