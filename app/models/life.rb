class Life
  attr_accessor :north, :south, :east, :west

  def initialize
    @neighbors = 0
  end

  def survives?
    @neighbors == 2
  end

  def north= life
    @north = life
    life.south = self unless life.south

    increment_neighbors
  end

  def south= life
    @south = life
    life.north = self unless life.north

    increment_neighbors
  end

  def east= life
    @east = life
    life.west = self unless life.west

    increment_neighbors
  end

  def west= life
    @west = life
    life.east = self unless life.east

    increment_neighbors
  end

  private

  def increment_neighbors
    @neighbors = @neighbors + 1
  end
end
