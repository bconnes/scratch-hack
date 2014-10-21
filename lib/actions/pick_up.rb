require_relative '../action.rb'

class PickUpAction < Action
  def initialize(params = {})
    @action = :pick_up
    @requirement = :integer
    @actor = params[:actor] || $player
  end

  def setup
    $window.log('Choose an item to pick up.')
    @actor.level.display_items_at(@actor.x, @actor.y)
  end

  def execute(integer)
    item = @actor.level.pick_up_item_at(@actor.x, @actor.y, integer)
    if item
      @actor.get_item(item)
    else
      $window.log('No item with that ID.')
    end
  end
end