require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = Array.new
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bikes)
    fail 'Docking station full' if @bikes.count >= 20
    @bikes << bikes
  end

end
