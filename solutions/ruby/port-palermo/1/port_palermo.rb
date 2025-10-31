module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE
  TERMINAL_A = ['OIL', 'GAS']

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    id = ship_identifier.to_s
    TERMINAL_A.include?(id[0..2]) ? :A : :B
  end
end
