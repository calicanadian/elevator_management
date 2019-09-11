require 'set'

class Elevator

  def initialize
    @lifts = (1..4).to_a
    @floors = (1..10).to_a
    @lift_positions = [[1], [1], [1], [1]]
    puts @lifts.inspect
    puts @floors.inspect
    puts @lift_positions.inspect
  end

  def request_elevator(floor)
    elevator = @lifts[rand(1..4) - 1]
    puts elevator
    go_to_floor(elevator, @lift_positions[elevator - 1], floor)
  end

  def go_to_floor(elevator, start, destination)
    if start > destination
      puts "going down"
    elsif start < destination
      puts "going up"
    else
      puts "open doors"
    end
  end

  def report_floor(elevator, floor)
  end

  def self.open_doors(elevator)
  end

  def self.close_doors(elevator)
  end

  def count_trips(elevator)
  end

end

ele = Elevator.new()

ele.request_elevator(4)
