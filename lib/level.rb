require_relative './item.rb'

class Level
  def initialize(params = {})
    #put info the level maker needs into params
    @floor = params[:floor] || 1
    @tilesheet = params[:tilesheet] || TileSheet.default_tilesheet()
    @tiles = build_level
    @size_x = params[:size_x]
    @size_y = params[:size_y]
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
    grid[6][7].add_item(@tilesheet.sword)
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
  end

  def display_items_at(x, y)
    @tiles[y][x].display_items
  end

  def pick_up_item_at(x, y, index)
    @tiles[y][x].take_item(index)
  end

  def walkable?(destination_x, destination_y)
    @tiles[destination_x][destination_y].walkable
  end

  def left_of(x, y)
    @tiles[x - 1][y]
  end

  def right_of(x, y)
    @tiles[x + 1][y]
  end

  def above(x, y)
    @tiles[x][y - 1]
  end

  def below(x, y)
    @tiles[x][y + 1]
  end
end