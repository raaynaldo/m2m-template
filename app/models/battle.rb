class Battle
  attr_reader :player, :monster
  attr_accessor :winner
  @@all = []

  def initialize(player, monster)
    @player = player
    @monster = monster
    @winner = nil

    @@all << self
  end

  def self.all
    @@all
  end

  def battle
    # loop till player or monster hp = 0

    # monster hit (rand num 0 - 3)
    monsterHit = rand(3 + monster.level)
    puts "#{monster.type} Hit : #{monsterHit} #{monster.taunt}!!"

    # player hit (rand num 0 - 3)
    playerHit = rand(3 + player.level)
    puts "#{player.job} Hit : #{playerHit}"
    puts ''

    #  player > monster ? player level ++ : monster level ++
    if playerHit > monsterHit
      player.level += 1
      self.winner = player
      player.inv.push rand(50)
      puts "The winner is #{winner.job} and they got #{player.inv.last}"
    elsif playerHit < monsterHit
      monster.level += 1
      self.winner = monster
      puts "The winner is #{winner.type}"
    else
      puts 'The battle is draw'
    end

    puts "----#{battle_name}----"
    puts "#{player.job}'s level : #{player.level}"
    puts "#{monster.type}'s level : #{monster.level}"

    winner
  end

  def battle_name
    "#{player.job} vs #{monster.type}"
  end

  def most_wins
    moster.level > player.level ? monster : player
  end
end
