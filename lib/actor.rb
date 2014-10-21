require_relative './tile.rb'

class Actor
  attr_accessor :x, :y, :items, :walkable, :level, :wielded_item

  def initialize(params = {})
    @level = params[:level]
    @tile = params[:tile_index] || 0
    @tile_sheet ||= Gosu::Image.load_tiles($window, '../media/Characters/Player1.png', 16, 16, true)
    @character = params[:character] || @tile_sheet[0]
    @x = params[:x] || 1
    @y = params[:y] || 1
    @inventory = params[:items] || []
    @health = params[:health] || 10
    @max_health = params[:max_health] || @health
    @walkable = params[:walkable]
    @walkable ||= false
    @base_attack = params[:base_attack] || 1
    @wielded_item = nil
  end

  def draw(z = 0)
    @character.draw(@x * 16, @y * 16, z)
  end

  def attack(direction)

  end

  def damage
    if @wielded_item
      @base_attack + @wielded_item.damage
    else
      @base_attack
    end
  end

  def take_hit(min, max, message = "")
    message ? $window.log(message) : nil
    damage = (min..max).to_a.sample
    @health -= damage
    $window.log("You took #{damage} damage.")
  end

  def wield(id)
    @wielded_item = @inventory.delete_at(id)
  end

  def unweild(id)
    @inventory << @wielded_item
    @wielded_item = nil
  end

  def get_item(item)
    @inventory << item
  end

  def rest
    1.in(10) do
      @health = [@health + 1, @max_health].min
    end
  end

  def display_items
    @inventory.each_with_index do |item, index|
      $window.log("#{index}: #{item.name}")
    end
  end

  def items
    (@inventory + [@wielded_item]).compact
  end

  def drop(index)
    @level.add_item_at(@x, @y, @inventory.delete_at(index))
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