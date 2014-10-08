require_relative '../spec_helper'

describe Board do
  describe '#false_play' do
    it 'adds the card to the discard pile' do
      expect{subject.false_play(Card.new(:blue, 2))}.to change(subject.discards, :length).by(1)
    end

    it 'removes a fuse counter' do
      expect{subject.false_play(Card.new(:blue, 2))}.to change(subject, :fuses).by(-1)
    end
  end

  describe '#play' do
    it 'adds a card to the play_area if you play a one on an empty board' do
      expect{subject.play(Card.new(:blue,1))}.to change(subject.play_area[:blue], :size).by (1)
    end

    it 'is a false play if you play a two on an empty board' do
      allow(subject).to receive(:false_play) { nil }
      subject.play(Card.new(:red, 2))
      expect(subject).to have_received(:false_play)
    end

    it 'is a false play if you play a five on a pile that already has a five' do
      [1,2,3,4,5].each do |i|
        subject.play(Card.new(:green, i))
      end
      allow(subject).to receive(:false_play) { nil }
      subject.play(Card.new(:green, 5))
      expect(subject).to have_received(:false_play)
    end

    it 'adds a hint (if possible) when you play a five' do
      [1,2,3,4].each do |i|
        subject.play(Card.new(:yellow, i))
      end
      allow(subject).to receive(:add_hint) {nil}
      subject.play(Card.new(:yellow, 5))
      expect(subject).to have_received(:add_hint)
    end
  end
end