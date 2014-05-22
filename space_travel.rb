
  def space_travel(dist , accel = 6)
  	time_taken = 0
  	g = 9.8
  	speed = 0
  	halfwayPoint = 1000*dist
  	while halfwayPoint > 0
  		time_taken = time_taken + 1
  		speed = speed + g * accel
  		halfwayPoint = halfwayPoint - speed
  	end

  	return time_taken , speed

  end

travel_time, speed = space_travel(1000, 1000)
puts "#{travel_time} seconds to travel 1000 km with a max speed of #{speed/1000} km/s"

travel_time, speed = space_travel(1000000, 1000)
puts "#{travel_time/60} minutes to travel 1000000 km with a max speed of #{speed/1000} km/s"

travel_time, speed = space_travel(1000000000, 1000)
puts "#{travel_time/360} hours to travel 1000000000 km with a max speed of #{speed/1000} km/s"

travel_time, speed = space_travel(100000000000000, 1000)
puts "#{(travel_time/360)/24} days to travel 1000000000000 km with a max speed of #{speed/1000} km/s"

# travel_time = space_travel(1000000)
# puts "#{travel_time} to travel 1000000 km"

# travel_time = space_travel(1000000000)
# puts "#{travel_time} to travel 1000000000 km"

# travel_time = space_travel(1000000000000)
# puts "#{travel_time} to travel 1000000000000 km"


