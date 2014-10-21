require_relative '../../item.rb'

class Equipment < Item
  def initialize(params = {})
    super(params)
    @base_defense = 1
  end

  def defense
    @base_defense
  end

end