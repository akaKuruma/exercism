=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_reader :rows

  def initialize(str_matrix)
    @rows = str_matrix.lines(chomp: true).map do |row|
      row.split.map(&:to_i)
    end
  end

  def columns(index = nil)
    @all_columns ||= build_all_columns
  end

  private

  def build_all_columns
    columns = []
    rows.first.length.times { columns << [] }

    rows.each do |row|
      row.each_with_index do |item, index|
        columns[index] << item
      end
    end

    columns
  end
end