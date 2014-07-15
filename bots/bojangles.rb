class Bojangles < RTanque::Bot::Brain
  NAME = 'bojangles'
  include RTanque::Bot::BrainHelper
  TURRET_FIRE_RANGE = RTanque::Heading::ONE_DEGREE * 10
  def tick!
    ## main logic goes here
    
    # use self.sensors to detect things
    # See http://rubydoc.info/github/awilliams/RTanque/master/RTanque/Bot/Sensors
    
    # use self.command to control tank
    # See http://rubydoc.info/github/awilliams/RTanque/master/RTanque/Bot/Command
    
    # self.arena contains the dimensions of the arena
    # See http://rubydoc.info/github/awilliams/RTanque/master/frames/RTanque/Arena
    # if self.sensors.position.on_wall?
    #   self.command.heading = RTanque::Heading::HALF_ANGLE
    #   self.command.speed = 0
    # end
    #
    # if self.sensors.radar.count >= 1
    #   self.command.speed = RTanque::Bot::MAX_SPEED
    #   self.command.heading = self.sensors.radar.first.heading
    #   self.command.turret_heading = self.sensors.radar.first.heading
    # end

    @arena = arena
    @point = RTanque::Point.new(350, 600, @arena)
    self.command.heading = @point
    self.command.radar_heading = self.sensors.radar_heading + MAX_RADAR_ROTATION
    # command.heading = RTanque::Heading::FULL_ANGLE

    at_tick_interval(100) do
      puts @point
      puts sensors.position
      puts "Tick ##{sensors.ticks}!"
      puts " Gun Energy: #{sensors.gun_energy}"
      puts " Health: #{sensors.health}"
      puts " Position: (#{sensors.position.x}, #{sensors.position.y})"
      puts sensors.position.on_wall? ? " On Wall" : " Not on wall"
      puts " Speed: #{sensors.speed}"
      puts " Heading: #{sensors.heading.inspect}"
      puts " Turret Heading: #{sensors.turret_heading.inspect}"
      puts " Radar Heading: #{sensors.radar_heading.inspect}"
      puts " Radar Reflections (#{sensors.radar.count}):"
      sensors.radar.each do |reflection|
        puts "  #{reflection.name} #{reflection.heading.inspect} #{reflection.distance} "
      end
    end
  end


end
