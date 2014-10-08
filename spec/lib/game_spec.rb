require_relative '../spec_helper.rb'

describe Game do
  describe '#play' do
    it 'runs until the deck is empty' do
      subject.play
      expect(subject.deck).to be_empty
    end
  end
end