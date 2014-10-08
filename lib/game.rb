class Game
  attr_reader :deck, :players, :board

  def initialize(players = 4)
    @deck = Deck.new
    @players = []
    @board = Board.new
    players.times do
      @players << Player.new(self)
    end
  end

  def play
    until @deck.empty? or @board.fuses == 0
      @players[0].take_turn!
     @players << @players.shift
    end

    if @deck.empty?
      puts 'Played game until the end!'

    elsif @board.fuses == 0
      puts 'Played game until we ran out of fuses!'
    end
  end
end