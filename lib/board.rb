require_relative './level.rb'
require_relative 'actors/player.rb'
require_relative './console.rb'
require_relative './panel.rb'

class Board
  attr_accessor :player, :level, :turns
  def initialize(params = {})
    @tiles = build_board
    $player = Player.new()
    @level = Level.new()
    $player.level = @level
    $console = Console.new(stack: ['Console Initiated'], width: 160)
    @panel = Panel.new(width: 160)
    @turns = 0
  end

  def build_board
    @tilesheet = TileSheet.default_tilesheet()
  end

  def tick
    @turns += 1
    @level.tick
  end

  def draw
    @level.draw(0,0)
    $console.draw(640,0,0)
    @panel.draw(800, 0, 0)
  end
end