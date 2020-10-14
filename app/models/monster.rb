require_relative "./person.rb"

class Monster < Person
  attr_accessor :type, :hp, :level, :taunt
  @@all = []

  def initialize(real_name, type, taunt, hp = 10, special_skill = nil, level = 1, location = nil)
    super(real_name)
    @type = type
    @hp = hp
    @special_skill = @special_skill
    @level = level
    @location = location
    @taunt = taunt
    @@all << self
  end

  def ranking
    rank = @@all.sort_by{|monster| -monster.level}
    .index{ |monster| monster == self}+1
    puts "Hi #{self.real_name}, your monster ranking is #{rank}. #{taunt.upcase}!"
  end

  def ranking_by_type 
    type_rank = @@all.select{|monster| monster.type == self.type}.sort_by{|monster| -monster.level}.index{|monster| monster.real_name == self.real_name} + 1

    puts "Hi #{self.real_name}, your #{self.type} ranking is #{type_rank}. #{taunt.upcase}!"
  end

  def self.all
    @@all
  end

  def self.highest_level
    all.max_by { |monster| monster.level }
  end

  def self.top5
    count = 1
    puts "--------The Best Beasts---------"
    self.all.sort_by{ |monster| -monster.level }
    .take(5)
    .each{|monster|
   # puts "#{count}.\t#{monster.real_name}\t\t #{monster.type}\t\t  #{monster.level}"
    printf "%s. %-7s %-10s %s \n", count, monster.real_name, monster.type, monster.level
    count +=1
  }
  end


end