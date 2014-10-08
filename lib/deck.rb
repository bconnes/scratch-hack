require 'card.rb'

class Deck
  def initialize
    @deck = Array.new
    compile_deck
  end

  def draw!
    @deck.shift
  end

  def empty?
    @deck.empty?
  end

  private
    def compile_deck
      [1,1,1,2,2,3,3,4,4,5].each do |number|
        [:blue,:red,:white,:green,:yellow].each do |color|
          @deck << Card.new(color, number)
        end
      end
    end
end