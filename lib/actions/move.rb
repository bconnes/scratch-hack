require_relative '../action.rb'

class MoveAction < Action
  def initialize(direction, params = {})
    @direction = direction
    @requirement = false
    @actor = params[:actor] || $player
  end

  def execute
    @actor.move(@direction)
  end
end