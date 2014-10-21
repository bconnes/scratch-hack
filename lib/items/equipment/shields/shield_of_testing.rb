require_relative './shield.rb'

class ShieldOfTesting < Sword
  def initialize(params={})
    super(params)
    @tile_sheet ||= Gosu::Image.load_tiles($window, '../media/Items/Shield.png', 16, 16, true)
    @image = @tile_sheet[0]
    @name = 'Shield of Testing'
  end

  def damage
    if 1.in(2)
      @base_damage + 1
    else
      @base_damage
    end
  end
end