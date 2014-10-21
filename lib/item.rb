class Item
  attr_reader :image, :name
  def initialize(params = {})
    @image = params[:image]
    @name = params[:name]
  end

  def draw(x, y, z)
    @image.draw(x, y, z)
  end

  def self.sword_of_testing
    require_relative './items/weapons/swords/sword_of_testing.rb'
    SwordOfTesting.new
  end

  def self.sheild_of_testing
    require_relative './items/equipment/shields/shield_of_testing.rb'
    ShieldOfTesting.new
  end
end