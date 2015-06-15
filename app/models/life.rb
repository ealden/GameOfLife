class Life
  attr_accessor :north, :south

  def survives?
    north.present? and south.present?
  end

  def north= life
    @north = life
    life.south = self unless life.south
  end

  def south= life
    @south = life
    life.north = self unless life.north
  end
end
