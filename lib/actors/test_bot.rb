require_relative '../tile.rb'
require_relative '../actor.rb'
require_relative '../tilesheets/default.rb'


class TestBotActor < Actor
  def initialize(params)
    super(params)
    @character = @tilesheet.orc
    @walkable = false
  end

  def tick
    motion = [:left, :right, :up, :down].sample
    self.move(motion)
  end
end