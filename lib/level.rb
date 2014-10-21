require_relative './item.rb'
require_relative 'actors/test_bot.rb'

class Level
  def initialize(params = {})
    #put info the level maker needs into params
    @floor = params[:floor] || 1
    @tilesheet = params[:tilesheet] || TileSheet.default_tilesheet()
    @actors = [$player]
    @tiles = build_level
    @size_x = params[:size_x]
    @size_y = params[:size_y]
  end

  def tick
    @actors.each do |actor|
      actor.tick
    end
  end

  def build_level
    grid = []
    grid[0] = []
    40.times do
      grid[0] << @tilesheet.wall
    end
    38.times do
      array = []
      array << @tilesheet.wall
      38.times do
        array << @tilesheet.floor
      end
      array << @tilesheet.wall
      grid << array
    end
    grid << []
    40.times do
      grid[grid.length - 1] << @tilesheet.wall
    end
    grid[5][5] = @tilesheet.door
    grid[6][7].add_item(Item.sword_of_testing)
    grid[6][7].add_item(Item.sheild_of_testing)
    @actors << TestBotActor.new(x: 10, y: 10, level: self)
    return grid
  end

  def draw(x, y)
    starting_y = y
    @tiles.each do |row|
      starting_x = x
      row.each do |item|
        item.draw(starting_x, starting_y, 0)
        starting_x += 16
      end
      starting_y += 16
    end
    @actors.each do |actor|
      actor.draw(z=2)
    end
  end

  def display_items_at(x, y)
    @tiles[y][x].display_items
  end

  def pick_up_item_at(x, y, index)
    @tiles[y][x].take_item(index)
  end

  def add_item_at(x, y, item)
    @tiles[y][x].add_item(item)
  end

  def walkable?(destination_x, destination_y)
    items_to_check = Array.new(@actors)
    items_to_check.keep_if {|actor| actor.x == destination_x and actor.y == destination_y}
    items_to_check << @tiles[destination_x][destination_y]
    items_to_check.all? {|item| item.walkable}
  end

  def left(x, y)
    actor = Array.new(@actors)
    actor.keep_if { |actor| actor.x == x - 1 and actor.y == y}
    if actor.empty?
      @tiles[x - 1][y]
    else
      actor[0]
    end
  end

  def right(x, y)
    actor = Array.new(@actors)
    actor.keep_if { |actor| actor.x == x + 1 and actor.y == y}
    if actor.empty?
      @tiles[x + 1][y]
    else
      actor[0]
    end
  end

  def up(x, y)
    actor = Array.new(@actors)
    actor.keep_if { |actor| actor.x == x and actor.y == y - 1}
    if actor.empty?
      @tiles[x][y - 1]
    else
      actor[0]
    end
  end

  def down(x, y)
    actor = Array.new(@actors)
    actor.keep_if { |actor| actor.x == x and actor.y == y + 1}
    if actor.empty?
      @tiles[x][y + 1]
    else
      actor[0]
    end
  end
end