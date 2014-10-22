require 'gosu'
require_relative './action.rb'

class InputHandler
  def initialize
    @current_action = nil
    @waiting_for_text = nil
    @text = nil
  end

  def action_hash
    actions = {
      Gosu::KbO => Action.open,
      Gosu::KbC => Action.close,
      Gosu::KbB => Action.break,
      Gosu::KbP => Action.pick_up,
      Gosu::KbD => Action.drop,
      Gosu::KbR => Action.rest,
      Gosu::KbW => Action.wield,
      Gosu::KbLeft => Action.move(:left),
      Gosu::KbRight => Action.move(:right),
      Gosu::KbDown => Action.move(:down),
      Gosu::KbUp => Action.move(:up),
      Gosu::KbA => Action.attack
    }
    actions.default = Action.no_action
    actions
  end

  def direction_symbols
    {
        Gosu::KbLeft => :left,
        Gosu::KbRight => :right,
        Gosu::KbDown => :down,
        Gosu::KbUp => :up
    }
  end

  def get_direction_from_id(id)
    direction_symbols[id]
  end

  def handle(id)
    if @waiting_for_text
      if id == Gosu::KbEnter or id == Gosu::KbReturn
        @text = $window.text_input.text
        $window.text_input = nil
        @waiting_for_text = false
        if @current_action.requirement == :integer
          @text = @text.to_i
        end
        @current_action.execute(@text)
        @current_action = nil
      end
    elsif @current_action
      if @current_action.requirement == :direction
        direction = get_direction_from_id(id)
        @current_action.execute(direction)
        @current_action = nil
      end
    else
      action = action_hash[id]
      if action.requirement
        @current_action = action
        action.setup
        if action.requirement == :integer
          get_integer
          @waiting_for_text = true
        end
      else
        action.execute
        @current_action = nil
      end
    end
  end

  def get_integer
    text_input = Gosu::TextInput.new
    def text_input.filter(text_in)
      text_in.delete("^0-9")
    end
    $window.text_input = text_input
  end
end
