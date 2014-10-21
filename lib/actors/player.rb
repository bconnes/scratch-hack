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
    @inventory << item
    $window.log("Got #{item.name}")
  end

  def rest
    1.in(10) do
      $window.log('Resting has made you feel slightly better.')
      @health = [@health + 1, @max_health].min
    end
  end

  def break(direction)
    @level.send(direction, @x, @y).break
    $window.tick()
  end

  def close(direction)
    @level.send(direction, @x, @y).close
    $window.tick()
  end

  def open(direction)
    @level.send(direction, @x, @y).open
    $window.tick()
  end

  def attack(direction)
    @level.send(direction, @x, @y).take_hit(damage, damage)
    $window.tick()
  end

  def tick
    nil
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