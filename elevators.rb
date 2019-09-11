require 'set'

class Elevator

  def initialize
    @lifts = (1..4).to_a
    @floors = (1..10).to_a
    @lift_positions = [1, 1, 1, 1]
    @lift_trips = [0, 0, 0, 0]
    @elevator = 1
  end

  def request_elevator(elevator, floor)
    @elevator = elevator.nil? ? @lifts[rand(0..(@lifts.length))] : elevator
    floor = floor.to_i
    if floor < 1 || floor > 10
      puts "invalid entry, choose a floor between 1 and 10, try again."
      floor = gets.chomp
      request_elevator(nil, floor)
    else
      go_to_floor(@lift_positions[elevator], floor)
    end
  end

  def go_to_floor(start, destination)
    if start.to_i > destination.to_i
      puts "going down"
      trip_length = start - destination
      trip_length.times do |current_floor|
        sleep(2)
        report_floor((start - (current_floor + 1)))
        puts "DN: #{@lift_positions[@elevator]}"
      end
      open_doors
    elsif start.to_i < destination.to_i
      puts "going up"
      trip_length = destination - start
      trip_length.times do |current_floor|
        sleep(2)
        report_floor((start + (current_floor + 1)))
        puts "UP: #{@lift_positions[@elevator]}"
      end
      open_doors
    else
      puts "open doors"
      open_doors
    end
  end

  def report_floor(floor)
    @lift_positions[@elevator] = (floor)
    return
  end

  def open_doors
    puts "open doors elevator: #{@elevator}"
    puts "trip count: #{@lift_trips[@elevator]}"
    sleep(5)
    close_doors
  end

  def close_doors
    puts "close doors elevator: #{@elevator}"
    count_trips
    listen_for_new_request
  end

  def listen_for_new_request
    puts "Where to?"
    floor = gets.chomp
    if floor.match(/\d/)
      request_elevator(@elevator, floor.to_i)
    else
      puts "invalid input"
      open_doors
    end
  end

  def count_trips
    @lift_trips[@elevator] += 1
    maintenance_check
  end

  def maintenance_check
    p @lift_trips[@elevator]
    if @lift_trips[@elevator] == 100
      @lifts.delete_at(@elevator)
      puts "Elevator #{@elevator} is out of service for maintenance"
    end
  end

end

ele = Elevator.new()

ele.open_doors
