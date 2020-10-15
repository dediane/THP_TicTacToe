
class Game
  attr_accessor :player_X, :player_O, :board
  
  #Initialize a new game. 
  def initialize
    puts " "*11 + "-"*21
    puts " "*10 + "|" + " "*21 + "|"
    puts " "*10 + "|  SUPER MORPION !!!  |"
    puts " "*10 +"|" + " "*21 + "|"
    puts " "*11 + "-"*21 + "\n\n"
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
  @board = Board.new
   while @board.victory? == false
      @board.play_turn(@player_X)
      if @board.victory?
        puts "Félicitation #{player_X.name}, tu as gagné la partie!!!"
        @player_X.points += 1
        break
      end
      @board.play_turn(@player_O)
      if @board.victory?
        puts "Félicitation #{player_O.name}, tu as gagné la partie!!!"
        @player_O.points += 1
        break
      end
    end
  end

  def play_again?
    puts "Voulez-vous refaire une partie?"
    puts "(y/n) tapez 'y' pour yes / tapez 'n' pour no"
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else 
      self.play_again?
    end
  end

  def results
    puts "#{player_X.name} a gagné #{player_X.points} parties."
    puts "#{player_O.name} a gagné #{player_O.points} parties."
    if player_O.points > player_X.points
      puts "Félicitation #{player_O.name}, vous êtes le grand gagnant du SUPER MORPION!!!"
    elsif player_O.points < player_X.points
      puts "Félicitation #{player_X.name}, vous êtes le grand gagnant du SUPER MORPION!!!"
    else
      puts "Félicitation #{player_X.name} et #{player_O.name}, vous êtes arrivés ex-aequo au SUPER MORPION!!!"
    end
  end
end
