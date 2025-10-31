=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end

class ETL
  def self.transform(hash_input)
    hash_output = {}
    hash_input.each do |key, values|
      values.each do |value|
        hash_output[value.downcase] = key
      end
    end
    hash_output
  end
end
