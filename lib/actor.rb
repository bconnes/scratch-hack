require_relative './tile.rb'

class Actor
  attr_accessor :x, :y, :items

  def initialize(params = {})
    @level = params[:level]
    @tilesheet = params[:tilesheet] || Gosu::Image.load_tiles($window, '../media/Characters/Player1.png', 16, 16, true)
    @tile = params[:tile_index] || 0
    @character = Tile.new(image: @tilesheet[@tile])
    @x = params[:x] || 1
    @y = params[:y] || 1
    @items = params[:items] || []
  end

  def draw(z = 0)
    @character.draw(@x * 16, @y * 16, z)
  end

  def get_item(item)
    @items << item
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