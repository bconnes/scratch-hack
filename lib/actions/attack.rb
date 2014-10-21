require_relative '../action.rb'

class AttackAction < Action
  def initialize(params = {})
    @action = :break
    @requirement = :direction
    @actor = params[:actor] || $player
  end

  def setup
    $window.temp_log('Choose a direction to attack!')
  end

  def execute(direction)
    @actor.attack(direction)
  end
end