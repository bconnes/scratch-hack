require_relative '../tilesheet.rb'
require_relative '../tile.rb'
require_relative '../tiles/door.rb'

class DefaultTileSheet < TileSheet
  def initialize(params)
    @window = params[:window]
  end

  def wall
    @floor_sheet ||= Gosu::Image.load_tiles(@window, '../media/Objects/Floor.png', 16, 16, true)
    Tile.new(image: @floor_sheet[131], walkable: false)
  end

  def floor
    @floor_sheet ||= Gosu::Image.load_tiles(@window, '../media/Objects/Floor.png', 16, 16, true)
    Tile.new(image: @floor_sheet[148], walkable: true)
  end

  def door
    @door_sheet ||= Gosu::Image.load_tiles(@window, '../media/Objects/Door0.png', 16, 16, true)
    Door.new(status: :closed, open: @door_sheet[1], closed: @door_sheet[0], broken: @door_sheet[7])
  end
end