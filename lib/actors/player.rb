require_relative '../tile.rb'
require_relative '../actor.rb'

class Player < Actor
  def get_item(item)
    $window.log("Got #{item.name}")
  end
end