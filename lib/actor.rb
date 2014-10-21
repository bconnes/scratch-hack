require_relative './tile.rb'

class Actor
  attr_accessor :x, :y, :items, :walkable

  def initialize(params = {})
    @level = params[:level]
    @tile = params[:tile_index] || 0
    @tilesheet = TileSheet.default_tilesheet
    @character = params[:character] || @tilesheet.player
    @x = params[:x] || 1
    @y = params[:y] || 1
    @items = params[:items] || []
    @health = params[:health] || 10
    @max_health = params[:max_health] || @health
    @walkable = params[:walkable]
  end

  def draw(z = 0)
    @character.draw(@x * 16, @y * 16, z)
  end

  def take_hit(min, max, message = "")
    message ? $window.log(message) : nil
    damage = (min..max).to_a.sample
    @health -= damage
    $window.log("You took #{damage} damage.")
  end

  def get_item(item)
    @items << item
  end

  def rest
    1.in(10) do
      $window.log('Resting has made you feel slightly better.')
      @health = [@health + 1, @max_health].min
    end
  end

  def display_items
    @items.each_with_index do |item, index|
      $window.log("#{index}: #{item.name}")
    end
  end

  def drop(index)
    @level.add_item_at(@x, @y, @items.delete_at(index))
  end

  def move(direction)
    if direction == :up
      if @y - 1 > 0
        if @level.walkable?(@x, @y - 1)
          @y -= 1
        end
      end
    end
    if direction == :down
      if @y + 1 < 40
        if @level.walkable?(@x, @y + 1)
          @y += 1
        end
      end
    end
    if direction == :left
      if @x - 1 > 0
        if @level.walkable?(@x - 1, @y)
          @x -= 1
        end
      end
    end
    if direction == :right
      if @x + 1 < 40
        if @level.walkable?(@x + 1, @y)
          @x += 1
        end
      end
    end
  end
end