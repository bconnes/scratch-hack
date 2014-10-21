require_relative '../tile.rb'
require_relative '../actor.rb'

class Player < Actor
  attr_reader :health, :max_health

  def initialize(params = {})
    super(params)
    @max_health = 10
    @health = 5
  end

  def get_item(item)
    @items << item
    $window.log("Got #{item.name}")
  end

  def move(direction)
    if direction == :up
      if @y - 1 > 0
        if @level.walkable?(@x, @y - 1)
          @y -= 1
          $window.tick
        end
      end
    end
    if direction == :down
      if @y + 1 < 40
        if @level.walkable?(@x, @y + 1)
          @y += 1
          $window.tick
        end
      end
    end
    if direction == :left
      if @x - 1 > 0
        if @level.walkable?(@x - 1, @y)
          @x -= 1
          $window.tick
        end
      end
    end
    if direction == :right
      if @x + 1 < 40
        if @level.walkable?(@x + 1, @y)
          @x += 1
          $window.tick
        end
      end
    end
  end

end