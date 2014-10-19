class TileSheet
  def initialize(params = {})
  end

  def self.default_tilesheet(params = {})
    require_relative './tilesheets/default.rb'
    return DefaultTileSheet.new(params)
  end

  def tiles
    raise NotImplementedError
  end

  def wall
    raise NotImplementedError
  end

  def floor
    raise NotImplementedError
  end
end