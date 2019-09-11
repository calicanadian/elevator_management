require 'set'

class Elevator

  def initialize
    @lifts = (1..4).to_a
    @floors = (1..10).to_a
    @lift_positions = [[1], [1], [1], [1]]
    @lift_trips = [[0], [0], [0], [0]]
    # puts @lifts.inspect
    # puts @floors.inspect
    # puts @lift_positions.inspect
  end

  def request_elevator(floor)
    elevator = @lifts[rand(1..4) - 1]
    # puts "elevator: #{elevator} "
    # puts "elevator: #{ @lift_positions[elevator - 1][0]} "
    go_to_floor(elevator, @lift_positions[elevator - 1][0], floor)
  end

  def go_to_floor(elevator, start, destination)
    if start.to_i > destination.to_i
      puts "going down"
      trip_length = start - destination
      trip_length.times do |current_floor|
        # @lift_positions[0][elevator] = (start - (current_floor + 1))
        sleep(2)
        report_floor(elevator, current_floor + 1)
        # puts @lift_positions[elevator][0]
      end
      open_doors(elevator)
    elsif start.to_i < destination.to_i
      puts "going up"
      # puts start
      # puts destination
      trip_length = destination - start
      trip_length.times do |current_floor|
        sleep(2)
        report_floor(elevator, current_floor + 1)
        puts "UP: #{@lift_positions[0][elevator]}"
      end
      open_doors(elevator)
    else
      puts "open doors"
    end
  end

  def report_floor(elevator, floor)
    @lift_positions[0][elevator] = (floor)
    return
  end

  def open_doors(elevator)
    count_trips(elevator)
    puts "open doors elevator: #{elevator}"
    sleep(5)
    close_doors(elevator)
  end

  def close_doors(elevator)
    puts "close doors elevator: #{elevator}"
  end

  def count_trips(elevator)
    puts elevator - 1
    # @lift_trips(elevator - 1) += 1
  end

end

ele = Elevator.new()

ele.request_elevator(4)
