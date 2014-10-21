require_relative '../action.rb'

class WieldAction < Action
  def initialize(params = {})
    @action = :wield
    @requirement = :integer
    @actor = params[:actor] || $player
    if @actor.items.empty?
      @requirement = false
    end
  end

  def setup
    $window.log('Choose an item to wield!')
  end

  def execute(integer = nil)
    if @actor.items.empty?
      $window.log('You have no items to wield!')
    else
      @actor.wield(integer)
    end
  end
end