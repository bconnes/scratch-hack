require 'deck.rb'
require 'game.rb'

class Player
  attr_accessor :hand

  def initialize(game, cards_to_draw= 4)
    @hand = Hash.new
    @game = game
    build_initial_hand(cards_to_draw)
    @players = Hash.new
  end

  def draw
    @hand[@game.deck.draw!] = {possible_colors: [:blue, :green, :red, :white, :yellow],
                               possible_numbers: [1,2,3,4,5]}
  end

  def build_initial_hand(cards)
    cards.times do
      draw
    end
  end

  def take_turn!
    discard(@hand.keys.sample)
  end

  def build_players
    @game.players.each do |player|
      @players[player] = player.hand
    end
  end

  def discard(card)
    @hand.delete(card)
    @game.board.discard(card)
    draw
  end

  def play(card)
    @hand.delete(card)
    @game.board.play(card)
    draw
  end

  def give_hint(player, number = nil, color = nil)
    player.hand.each do |card_hash|
      if color
        if card.color == color
          card_hash[possible_colors] = [color]
        end

      elsif number
        if card.number == number
          card_hash[possible_numbers] = [number]
        end
      end
    end
  end


end