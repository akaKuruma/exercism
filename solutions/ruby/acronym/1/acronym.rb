=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

module Acronym
  def self.abbreviate(long_name)
    long_name.split(/[\s,-]/).reduce("") do |acronym, word|
      word[0]&.match?(/[[a-zA-Z]]/) ? acronym << word[0].upcase : acronym
    end
  end
end