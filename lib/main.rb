require 'gosu'

require_relative './tilesheet.rb'
require_relative './board.rb'
require_relative './actor.rb'

class GameWindow < Gosu::Window
  def initialize
    super(800, 640, false)
    self.caption = 'Hack'
    $window = self
    @board = Board.new()
    @mode = :player
    @messages = []
  end

  def update
    clear_temps
  end

  def draw
    @board.draw
  end

  def button_down(id)
    if @mode == :player
      if id == Gosu::KbLeft
        $player.move(:left)
      end

      if id == Gosu::KbRight
        $player.move(:right)
      end

      if id == Gosu::KbUp
        $player.move(:up)
      end

      if id == Gosu::KbDown
        $player.move(:down)
      end

      if id == Gosu::KbO
        @mode = :open
        temp_log('Choose a direction to open!')
      end

      if id == Gosu::KbC
        @mode = :close
        temp_log('Choose a direction to close!')
      end

      if id == Gosu::KbB
        @mode = :break
        temp_log('Choose a direction to break!')
      end

      if id == Gosu::KbP
        @mode = :pick_up
        log('Choose an item to pick up!')
        @board.current_level.display_items_at($player.x, $player.y)
      end

    elsif @mode == :open
      if id == Gosu::KbLeft
        @board.current_level.left_of($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below($player.x, $player.y).open
        @mode = :player
      end

    elsif @mode == :close
      if id == Gosu::KbLeft
        @board.current_level.left_of($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below($player.x, $player.y).close
        @mode = :player
      end

    elsif @mode == :break
      if id == Gosu::KbLeft
        @board.current_level.left_of($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below($player.x, $player.y).break
        @mode = :player
      end

    elsif @mode == :pick_up
      number = get_number_from_id(id)
      item = @board.current_level.pick_up_item_at($player.x, $player.y, number)
      $player.get_item(item)
    end

  end

  def get_number_from_id(id)
    i = id.inspect.to_i
    if i == 39
      index = 0
    else
      index = i - 30
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
