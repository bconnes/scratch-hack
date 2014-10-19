class Level
  def initialize(params)
    #put info the level maker needs into params
    @window = params[:window]
    @floor = params[:floor] || 1
    @tilesheet = params[:tilesheet] || TileSheet.default_tilesheet(window: @window)
    @tiles = build_level
    @size_x = params[:size_x]
    @size_y = params[:size_y]
  end

  def build_level
    grid = []
    grid << Array.new(40) {|index| @tilesheet.wall}
    array = Array.new(38) {|index| @tilesheet.floor}
    array << @tilesheet.wall
    array.unshift(@tilesheet.wall)

    38.times do
      grid << Array.new(array)
    end
    grid << Array.new(40) {|index| @tilesheet.wall}
    grid[5][5] = @tilesheet.door
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