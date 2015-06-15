class Life
  attr_accessor :north, :south, :east, :west

  def initialize
    @neighbors = 0
  end

  def survives?
    @neighbors == 2 or @neighbors == 3
  end

  def rip!
    north.south = nil if north
    south.north = nil if south
    east.west   = nil if east
    west.east   = nil if west
  end

  def has_neighbors?
    @neighbors > 0
  end

  def north= life
    @north = life
    life.south = self unless life.nil? or life.south

    count_neighbors
  end

  def south= life
    @south = life
    life.north = self unless life.nil? or life.north

    count_neighbors
  end

  def east= life
    @east = life
    life.west = self unless life.nil? or life.west

    count_neighbors
  end

  def west= life
    @west = life
    life.east = self unless life.nil? or life.east

    count_neighbors
  end

  private

  def increment_neighbors
    @neighbors = @neighbors + 1
  end

  def count_neighbors
    @neighbors = 0

    increment_neighbors if north
    increment_neighbors if south
    increment_neighbors if east
    increment_neighbors if west
  end
end
