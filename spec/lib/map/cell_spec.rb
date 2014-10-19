require_relative('../../spec_helper.rb')

describe Cell do
  describe '#to_s' do
    it 'returns the char property' do
      cell = Cell.new(char: '@')
      expect(cell.to_s).to eq('@')
    end
  end
end