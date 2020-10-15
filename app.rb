require 'bundler'
Bundler.require

require_relative 'lib/app/player'
require_relative 'lib/app/game'
require_relative 'lib/app/board'
require_relative 'lib/app/boardcase'

def perform
  current_game = Game.new
  current_game.play
  while current_game.play_again?
    current_game.play
  end
  current_game.results
end

perform
