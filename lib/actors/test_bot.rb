require_relative '../tile.rb'
require_relative '../actor.rb'
require_relative '../tilesheets/default.rb'


class TestBotActor < Actor
  def initialize(params)
    super(params)
    @tile_sheet = params[:tile_sheet] || Gosu::Image.load_tiles($window, '../media/Characters/Humanoid0.png', 16, 16, true)
    @character = params[:character] || @tile_sheet[0]
    @walkable = false
  end

  def take_hit(min, max, message = "")
    message ? $window.log(message) : nil
    damage = (min..max).to_a.sample
    @health -= damage
    $window.log("Test bot took #{damage} damage.")
  end

  def tick
    motion = [:left, :right, :up, :down].sample
    self.move(motion)
  end
end