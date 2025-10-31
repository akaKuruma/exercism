=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end

class SpiralMatrix
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def matrix
    return [] if size.zero?
    return [[1]] if size == 1

    max = size * size
    result = Array.new(size) { Array.new(size) }
    value = 1
    start = 0
    limit = size - 1

    while value <= max
      (start..limit).each do |col|
        result[start][col] = value
        value += 1
      end

      (start + 1..limit).each do |row|
        result[row][limit] = value
        value += 1
      end

      (limit - 1).downto(start) do |col|
        result[limit][col] = value
        value += 1
      end

      (limit - 1).downto(start + 1) do |row|
        result[row][start] = value
        value += 1
      end

      start += 1
      limit -= 1
    end

    result
  end
end
