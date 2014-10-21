require 'gosu'
require 'probability'

require_relative './tilesheet.rb'
require_relative './board.rb'
require_relative './actor.rb'
require_relative './input_handler.rb'

class GameWindow < Gosu::Window
  attr_reader :board
  def initialize
    super(960, 640, false)
    self.caption = 'Hack'
    $window = self
    @board = Board.new()
    @mode = :player
    @messages = []
    @input_handler = InputHandler.new()
  end

  def update
  end

  def draw
    @board.draw
  end

  def tick
    clear_temps
    @board.tick
  end

  def button_down(id)
    @input_handler.handle(id)
  end

  def get_number_from_id(id)
    i = id.inspect.to_i
    if i == 39
      index = 0
    else
      index = i - 29
    end
    return index
  end

  def log(message)
    $console.log(message)
  end

  def temp_log(message)
    @messages << $console.log(message)
  end

  def clear_temps
    if @mode == :player
      if @messages
        @messages.sort.reverse.each do |id|
          $console.remove(id)
        end
        @messages = []
      end
    end
  end
end

window = GameWindow.new
window.show
