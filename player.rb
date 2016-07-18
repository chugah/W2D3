require 'colorize'

class Player
  attr_accessor :life
  attr_reader :name

  def initialize(name="")
	@name = name
	@life = 3
  end
end

