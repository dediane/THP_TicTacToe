#inizialize object Player with name, value, points

class Player
  attr_accessor :name, :value, :points

  def initialize(name, value)
    @name = name
    @value = value
    @points = 0
  end
end