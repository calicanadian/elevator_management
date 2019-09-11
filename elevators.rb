require 'set'

class Elevator

  def initialize
    @lifts = (1..4).to_a
    @floors = (1..10).to_a
    @lift_positions = [1, 1, 1, 1]
    @lift_trips = [0, 0, 0, 0]
    # puts @lifts.inspect
    # puts @floors.inspect
    # puts @lift_positions.inspect
  end

  def request_elevator(elevator, floor)
    puts "elevator: #{elevator} "
    elevator = elevator.nil? ? @lifts[rand(0..3)] : elevator
    puts "elevator: #{elevator} "
    puts "elevator: #{ @lift_positions[elevator]} "
    puts "elevator: #{ @lift_positions[elevator]} "
    go_to_floor(elevator, @lift_positions[elevator], floor)
  end

  def go_to_floor(elevator, start, destination)
    if start.to_i > destination.to_i
      puts "going down"
      trip_length = start - destination
      trip_length.times do |current_floor|
        # @lift_positions[elevator] = (start - (current_floor + 1))
        sleep(2)
        report_floor(elevator, (start - (current_floor + 1)))
        # puts @lift_positions[elevator]
      end
      open_doors(elevator)
    elsif start.to_i < destination.to_i
      puts "going up"
      puts "Start: #{start}"
      puts "Destination: #{destination}"
      trip_length = destination - start
      trip_length.times do |current_floor|
        sleep(2)
        report_floor(elevator, (start + (current_floor + 1)))
        puts "UP: #{@lift_positions[elevator]}"
      end
      open_doors(elevator)
    else
      puts "open doors"
    end
  end

  def report_floor(elevator, floor)
    @lift_positions[elevator] = (floor)
    puts "Elevator: #{elevator}"
    puts "Floor: #{floor}"
    puts "Current Floor: #{@lift_positions[elevator]}"
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
    listen_for_new_request(elevator)
  end

  def listen_for_new_request(elevator)
    puts "Where to?"
    floor = gets.chomp
    if floor.match(/\d/)
      request_elevator(elevator, floor.to_i)
    else
      puts "invalid input"
      open_doors(elevator)
    end
  end

  def count_trips(elevator)
    puts elevator - 1
    # @lift_trips(elevator - 1) += 1
  end

end

ele = Elevator.new()

ele.request_elevator(nil, 4)
