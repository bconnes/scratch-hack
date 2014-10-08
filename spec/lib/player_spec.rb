require_relative '../spec_helper'

describe Player do
  subject {Player.new(Game.new)}
  describe '#draw' do
    it 'adds a card to hand' do
      expect{subject.draw}.to change(subject.hand, :length).by(1)
    end
  end

  describe '#take_turn!' do

  end

  describe '#build_players' do
    it 'works' do
      subject.build_players
    end
  end
end