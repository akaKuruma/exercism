defmodule RobotSimulator do
  defstruct direction: :north, position: {0, 0}

  @valid_directions ~w(north east south west)a
  @valid_instructions ~w(A R L)

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(), do: %__MODULE__{}
  def create(_direction, nil), do: {:error, "invalid position"}

  def create(direction, _position) when not (direction in @valid_directions),
    do: {:error, "invalid direction"}

  def create(direction, position) do
    %__MODULE__{}
    |> set_direction(direction)
    |> set_position(position)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes()
    |> Enum.reduce_while(robot, fn instruction, r ->
      if instruction in @valid_instructions,
        do: {:cont, execute(r, instruction)},
        else: {:halt, {:error, "invalid instruction"}}
    end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%__MODULE__{} = robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%__MODULE__{} = robot), do: robot.position

  defp set_direction(robot, nil), do: robot

  defp set_direction(robot, direction) when direction in @valid_directions,
    do: Map.put(robot, :direction, direction)

  defp set_position(robot, nil), do: robot

  defp set_position(robot, {x, y} = position)
       when tuple_size(position) == 2 and is_integer(x) and is_integer(y),
       do: Map.put(robot, :position, position)

  defp set_position(_robot, _position), do: {:error, "invalid position"}

  defp execute(%{position: {x, y}} = robot, "A") do
    new_position =
      case robot.direction do
        :north -> {x, y + 1}
        :east -> {x + 1, y}
        :south -> {x, y - 1}
        :west -> {x - 1, y}
      end

    Map.put(robot, :position, new_position)
  end

  defp execute(robot, instruction),
    do: Map.put(robot, :direction, new_directon(robot.direction, instruction))

  @left_turns %{
    north: :west,
    east: :north,
    south: :east,
    west: :south
  }

  @right_turns %{
    north: :east,
    east: :south,
    south: :west,
    west: :north
  }
  defp new_directon(direction, "L"), do: Map.get(@left_turns, direction)
  defp new_directon(direction, "R"), do: Map.get(@right_turns, direction)
end
