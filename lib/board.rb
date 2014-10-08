class Board
  attr_reader :discards, :play_area, :fuses
  def initialize
    @discards = []
    @play_area = Hash.new
    [:blue, :red, :white, :yellow, :green].each do |color|
      @play_area[color] = []
    end
    @fuses = 3
    @hints = 8
  end

  def play(card)
    if @play_area[card.color].empty?
      if card.number == 1
        @play_area[card.color] << card
      else
        false_play(card)
      end
    elsif @play_area[card.color].max_by {|n| n.number}.number - card.number == -1
      if card.number == 5
        add_hint
      end
      @play_area[card.color] << card
    else
      false_play(card)
    end
  end

  def false_play(card)
    discard(card)
    @fuses = [@fuses - 1, 0].max
    return nil
  end

  def add_hint
    @hints == 8 ? nil : @hints += 1
  end

  def remove_hint
    @hints = [@hints - 1, 0].max
  end

  def discard(card)
    @discards << card
  end
end