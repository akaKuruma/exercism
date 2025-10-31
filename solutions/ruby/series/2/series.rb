=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(str)
    @str_digits = str
  end

  def slices(length)
    raise ArgumentError if @str_digits.length < length

    (0..@str_digits.length - length).reduce([]) do |r, i|
      r << @str_digits[i, length]
    end
  end
end