defmodule Witchcraft.Functor.Operator do
  import Witchcraft.Functor, only: [lift: 2]

  @doc ~S"""
  Alias for `lift`. As we'll see with `Witchcraft.Applicative`,
  this arrow points in the direction of data flow (just like `|>`), but we often
  prefer the function on the left side.

  ```elixir

  iex> (&(&1 * 10)) <~ [1,2,3]
  [10, 20, 30]

  ```

  """
  @spec (any -> any) <~ any :: any
  def func <~ args, do: lift(args, func)

  @doc ~S"""
  Alias for `lift` and `<~`, but with data flowing to the right.

  ```elixir

  iex> [1,2,3] ~> &(&1 * 10)
  [10, 20, 30]

  ```

  """
  @spec any ~> (any -> any) :: any
  def args ~> func, do: func <~ args
end