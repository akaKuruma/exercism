=begin
Write your code for the 'Gigasecond' exercise in this file. Make the tests in
`gigasecond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/gigasecond` directory.
=end

module Gigasecond
  GIGASENCOND = 10**9

  def self.from(datetime_base)
    datetime_base + GIGASENCOND
  end
end