require_relative '../tile.rb'

class WallTile < Tile
  def initialize(params = {})
    @status = params[:status]
    @base = params[:base]
  end

  def draw(x, y, z)
    if @base
      @base.draw(x, y, z)
    end
  end

  def break
    1.in(5) do
      $player.take_hit(0, 2, message = 'Kicking a wall hurts!')
    end
    $window.tick
  end

  def walkable
    false
  end
end