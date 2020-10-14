require_relative './person.rb'

class Player < Person
  attr_accessor :job, :hp, :level, :slogan, :inv
  @@all = []

  def initialize(real_name, job, hp = 10, special_skill = nil, level = 1, slogan = "")
    super(real_name)
    @job = job
    @hp = hp
    @special_skill = special_skill
    @level = level
    @slogan = slogan
    @inv = []

    @@all << self
  end

  def ranking
    rank = @@all.sort_by { |player| -player.level}
    .index(self) + 1

    puts "Hi #{self.real_name}, your player ranking is #{rank}. #{self.slogan}"
  end

  def ranking_by_job
    rank = @@all.select {|player| player.job == self.job}
    .sort_by {|player| -player.level}
    .index(self) + 1

    puts "Hi #{self.real_name}, your #{self.job} ranking is #{rank}. #{self.slogan}"
  end

  def self.highest_level
    self.all.max_by { |player| player.level }
  end

  def self.all
    @@all
  end

  def self.top5
    puts '--------The Top 5 Heroes--------'
    count = 1
    self.all
      .sort_by { |player| -player.level}
      .take(5)
      .each do |player|
      # puts "#{count}.\t#{player.real_name}\t#{player.job}\t#{player.level}"

      printf "%s. %-7s %-10s %s\n", count, player.real_name, player.job, player.level
      count += 1
    end
  end
end
