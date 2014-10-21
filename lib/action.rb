class Action
  attr_reader :requirement, :action, :actor
  def initialize(params = {})
    @action = params[:action]
    @requirement = params[:requirement]
  end

  def setup
    'explanatory message!'
  end

  def execute(requirement)
    "execute #{requirement}"
  end

  def self.move(direction)
    require_relative './actions/move.rb'
    MoveAction.new(direction)
  end

  def self.open
    require_relative './actions/open.rb'
    OpenAction.new
  end

  def self.drop
    require_relative './actions/drop.rb'
    DropAction.new
  end

  def self.break
    require_relative './actions/break.rb'
    BreakAction.new
  end

  def self.close
    require_relative './actions/close.rb'
    CloseAction.new
  end

  def self.pick_up
    require_relative './actions/pick_up.rb'
    PickUpAction.new
  end

  def self.rest
    require_relative './actions/rest.rb'
    RestAction.new
  end

  def self.no_action
    require_relative './actions/no_action.rb'
    NoActionAction.new
  end

  def self.wield
    require_relative './actions/wield.rb'
    WieldAction.new
  end

  def self.attack
    require_relative './actions/attack.rb'
    AttackAction.new
  end
end