require_relative '../action.rb'

class DropAction < Action
  def initialize(params = {})
    @action = :drop
    @requirement = :integer
    @actor = params[:actor] || $player
  end

  def setup
    $window.log('Choose an item to drop!')
    @actor.display_items
  end

  def execute(integer)
    @actor.drop(integer)
  end
end