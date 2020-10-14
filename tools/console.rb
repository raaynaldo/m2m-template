require_relative '../config/environment.rb'
require 'faker'
require 'pry'

# create test data/variables here
swordsman = Player.new('Ray','Swordsman', 20, nil, 20, "you can do it!")
Player.new('dan','Swordsman', 20, nil, 10, "you can do it!")  
Player.new('andrew','Swordsman', 20, nil, 5, "you can do it!")  
Player.new('jack','Swordsman', 20, nil, 3, "you can do it!")  
Player.new('bryan','Swordsman', 20, nil, 30, "you can do it!")  
  
magician = Player.new('Sharad','Magician', 20, nil, 10)
priest = Player.new('Jake','Priest', 20, 5)

goblin = Monster.new("Paul",'Goblin', "scream", 20)
5.times do
Monster.new(Faker::Name.first_name ,'Goblin', "scream", 20, nil,rand(20)+1)
end

werewolf = Monster.new('Matteo','Werewolf', "growl", 20)

swordsman_vs_goblin = Battle.new(swordsman, goblin)
magician_vs_werewolf = Battle.new(magician, werewolf)

1.times do
  swordsman_vs_goblin.battle
end

# 3.times do
#   magician_vs_werewolf.battle
# end

puts Player.highest_level.real_name
puts Monster.highest_level.real_name

# puts Faker::Name.name   
# puts Faker::Games::Heroes.name

Player.top5
Monster.top5
# binding.pry
goblin.ranking
goblin.ranking_by_type
swordsman.ranking
swordsman.ranking_by_job

puts "End line of Code"