require_relative '../tilesheet.rb'
require_relative '../tile.rb'
require_relative '../tiles/door.rb'
require_relative '../tiles/wall.rb'

class DefaultTileSheet < TileSheet
  def initialize(params = {})
  end

  def wall
    @floor_sheet ||= Gosu::Image.load_tiles($window, '../media/Objects/Floor.png', 16, 16, true)
    WallTile.new(base: @floor_sheet[131])
  end

  def floor
    @floor_sheet ||= Gosu::Image.load_tiles($window, '../media/Objects/Floor.png', 16, 16, true)
    Tile.new(image: @floor_sheet[148], walkable: true)
  end

  def door
    @door_sheet ||= Gosu::Image.load_tiles($window, '../media/Objects/Door0.png', 16, 16, true)
    DoorTile.new(status: :closed, open: @door_sheet[1], closed: @door_sheet[0], broken: @door_sheet[7], base: @floor_sheet[148])
  end

  def sword
    @weapon_sheet ||= Gosu::Image.load_tiles($window, '../media/Items/MedWep.png', 16, 16, true)
    Item.new(image: @weapon_sheet[0], name: 'Sword of Testing')
  end

  def shield
    @shield_sheet ||= Gosu::Image.load_tiles($window, '../media/Items/Shield.png', 16, 16, true)
    Item.new(image: @shield_sheet[0], name: 'Shield of Testing')
  end

  def player
    @player_sheet ||= Gosu::Image.load_tiles($window, '../media/Characters/Player1.png', 16, 16, true)
    Tile.new(image: @player_sheet[0], walkable: false)
  end

  def orc
    @orc_sheet ||= Gosu::Image.load_tiles($window, '../media/Characters/Humanoid0.png', 16, 16, true)
    Tile.new(image:@orc_sheet[0], walkable: false)
  end
end