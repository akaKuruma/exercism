=begin
Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
`matching_brackets_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matching-brackets` directory.
=end

class Brackets
  BRACKETS = { '(' => ')', '[' => ']', '{' => '}' }

  def self.paired?(string)
    stack = []

    string.each_char do |char|
      if BRACKETS.key?(char)
        stack.push(char)
      elsif BRACKETS.value?(char)
        return false if stack.pop != BRACKETS.key(char)
      end
    end

    stack.empty?
  end
end
