require_relative '../../item.rb'

class Weapon < Item
  def initialize(params = {})
    super(params)
    @base_damage = 1
  end

  def damage
    @base_damage
  end
end