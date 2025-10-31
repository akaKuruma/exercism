defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer

  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(l), do: do_reverse([], l)

  defp do_reverse(reversed, []), do: reversed
  defp do_reverse(reversed, [h | t]), do: do_reverse([h | reversed], t)

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []
  def filter([h | t], f), do: if(f.(h), do: [h | filter(t, f)], else: filter(t, f))

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, []), do: a
  def append([], b), do: b
  def append([h | t], b), do: [h | append(t, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]) when is_list(h), do: append(concat(h), concat(t))
  def concat([h | t]), do: [h | concat(t)]
end
