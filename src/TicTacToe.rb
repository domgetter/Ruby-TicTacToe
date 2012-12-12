# TicTacToe.rb

# Write a tic-tac-toe  program where  a human user can
# play against  an AI bot,and  where two  AI bots  can
# play against each other. Write input and output code
# so that it's intuitive for the user.

require './Player.rb'
require './Game.rb'
require './Row.rb'
require './Column.rb'
require './Diagonal.rb'
require './Cell.rb'

puts "Welcome to this wonderful game of TicTacToe!"
print "Please choose a game mode: "
input = gets.chomp

while input != "1" && "2"
  print "Please choose a game mode: "
  input = gets.chomp
end

gameMode = input

# if game mode is 1, set an ai and a human, if 2, set two ais

if(gameMode == 1)
  players = [Player.new("Human"),Player.new]
else
  players = Array.new(2) {Player.new}
end

# start the game

size = 3

game = Game.new(size)

# draw a blank board

game.output

# have players go until game is over

while(!game.over?)

  players.each do |player|
    index = players.index(player)
    player.go(game, index)
	  game.output
	  break if game.over?
  end
  
end

# once game is over, display so

puts "Game is over!"