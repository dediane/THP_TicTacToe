
class Game
  attr_accessor :player_X, :player_O, :board
  
  def initialize
    puts " -------------------------------"
    puts "| Nous allons jouer au Morpion! |"
    puts " -------------------------------\n\n"
    puts "Le première joueur jouera avec les croix X."
    puts "Joueur 1, quel est ton prénom?"
    @player_X = Player.new(gets.chomp, "X")
    puts "Très bien, bienvenue #{player_X.name}.\n\n"
    puts "Le second joueur jouera avec les ronds O."
    puts "Joueur 2, peux-tu me donner ton prénom?"
    @player_O = Player.new(gets.chomp, "O")
    puts "Parfait, bienvenue #{player_O.name}.\n\n"
    puts "Nous sommes prêt à commencer la partie!\n"
    @board = Board.new
  end

  def play
   while @board.victory? == false
      @board.play_turn(@player_X)
      if @board.victory?
        puts "Félicitation #{player_X.name}, tu as gagné la partie!!!"
        break
      end
      @board.play_turn(@player_O)
      if @board.victory?
        puts "Félicitation #{player_O.name}, tu as gagné la partie!!!"
        break
      end
    end
  end
end
