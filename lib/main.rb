require 'gosu'

require_relative './tilesheet.rb'
require_relative './board.rb'

class GameWindow < Gosu::Window
  def initialize
    super(640, 640, false)
    self.caption = 'Gosu Tutorial Game'
    @board = Board.new({window: self})
    @mode = :player
  end

  def update
  end

  def draw
    @board.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
    if @mode == :player
      if id == Gosu::KbLeft
        @board.player.move(:left)
      end

      if id == Gosu::KbRight
        @board.player.move(:right)
      end

      if id == Gosu::KbUp
        @board.player.move(:up)
      end

      if id == Gosu::KbDown
        @board.player.move(:down)
      end

      if id == Gosu::KbO
        @mode = :open
      end

      if id == Gosu::KbC
        @mode = :close
      end

      if id == Gosu::KbB
        @mode = :break
      end

    elsif @mode == :open
      if id == Gosu::KbLeft
        @board.current_level.left_of(@board.player.x, @board.player.y).open
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of(@board.player.x, @board.player.y).open
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above(@board.player.x, @board.player.y).open
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below(@board.player.x, @board.player.y).open
        @mode = :player
      end

    elsif @mode == :close
      if id == Gosu::KbLeft
        @board.current_level.left_of(@board.player.x, @board.player.y).close
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of(@board.player.x, @board.player.y).close
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above(@board.player.x, @board.player.y).close
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below(@board.player.x, @board.player.y).close
        @mode = :player
      end

    elsif @mode == :break
      if id == Gosu::KbLeft
        @board.current_level.left_of(@board.player.x, @board.player.y).break
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.current_level.right_of(@board.player.x, @board.player.y).break
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.current_level.above(@board.player.x, @board.player.y).break
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.current_level.below(@board.player.x, @board.player.y).break
        @mode = :player
      end

    end

  end
end

window = GameWindow.new
window.show
