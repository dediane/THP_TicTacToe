#initialize game object with 2 player and a board
class Game
  attr_accessor :player_X, :player_O, :board
  
  #Initialize a new game. 
  def initialize
    puts " "*11 + "-" *21
    puts " "*10 + "|" + " "*21 + "|"
    puts " "*10 + "|  " + "SUPER MORPION !!!".black.on_white.underline + "  |"
    puts " "*10 +"|" + " "*4 +"\u{1F534}\u{1F7E0}\u{1F7E1}\u{1F7E2}\u{1F535}\u{1F7E3}" + " "*5 + "|"
    puts " "*11 + "-"*21
    puts "-"*43
    puts " "*6 + "\u{2716}\u{1F525}"*10 + "\n\n"
    puts "Le première joueur jouera avec les croix X.\n\n".underline
    puts "Joueur 1, quel est ton prénom?"
    print "> "
    @player_X = Player.new(gets.chomp.red, "X".red)
    puts "\u{1F534} Très bien, bienvenue #{player_X.name}.\u{1F44B}\n Ta couleur sera le " + "ROUGE".red
    puts "\n\nLe second joueur jouera avec les cercles O.\n\n".underline
    puts "Joueur 2, peux-tu me donner ton prénom?"
    print "> "
    @player_O = Player.new(gets.chomp.blue, "O".blue)
    puts "\u{1F535} Parfait, bienvenue #{player_O.name}.\u{1F44B}\n Ta couleur sera le " + "BLEU".blue
    puts "\n\n" + " "*5 + "\u{2716}\u{1F525}"*10
    puts "\n\n" + "NOUS SOMMES PRÊTS À COMMENCER LA PARTIE!!!!".black.on_white
    puts "\n\n" + " "*5 + "\u{2716}\u{1F525}"*10
    @board = Board.new
  end

  #Play and prompt result in case of victory.
  def play
  @board = Board.new
   while @board.victory? == false 
      @board.play_turn(@player_X)
      if @board.victory?
        puts "\nFélicitation #{player_X.name}!!!\n\nTu as gagné la partie!!!\n" + "\u{1F389}"*12 + "\n\n"
        @player_X.points += 1
        break
      elsif @board.game_nul?
        puts "Situation bloquée!!!"
        puts " "*5 + "\u{1F53A}"*5 + "\n\n"
        break
      end
      @board.play_turn(@player_O)
      if @board.victory?
        puts "\nFélicitation #{player_O.name}!!!\n\nTu as gagné la partie!!!\n" + "\u{1F389}"*12 + "\n\n"
        @player_O.points += 1
        break
      elsif @board.game_nul?
        puts "Situation bloquée!!!"
        puts " "*5 + "\u{1F53A}"*5 + "\n\n"
        break
      end
    end
  end

  #Ask the users if they want to play again.
  def play_again?
    puts "Voulez-vous refaire une partie? \u{1F3AE}".underline.black.on_white
    puts "(y/n) tapez 'y' pour yes / tapez 'n' pour no"
    answer = gets.chomp.downcase
    puts "\n"
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else 
      self.play_again?
    end
  end

  #prompt the final results before users quit the game
  def results
    puts "-" * 50 + "\n\n"
    puts "#{player_X.name} a gagné #{player_X.points} parties.\n\n"
    puts "#{player_O.name} a gagné #{player_O.points} parties.\n\n"
    puts "-" * 50 + "\n\n"
    if player_O.points > player_X.points
      puts " "*10 + "\u{1F389}" + "Félicitation #{player_O.name} " + "\u{1F389}" + "\n\n" +  "\u{1F389}"*3 + "Vous êtes le grand gagnant du " + " \u{1F389}"*3
    elsif player_O.points < player_X.points
      puts " "*10 + "\u{1F389}" + "Félicitation #{player_X.name} "+ "\u{1F389}" + "\n\n" +  "\u{1F389}"*3 + "Vous êtes le grand gagnant du " + " \u{1F389}"*3
    else
      puts " "*8 + "\u{1F389}" + "Félicitation #{player_X.name} et #{player_O.name} " + "\u{1F389}" + "\n\n" +  "\u{1F389}"*3 + "vous êtes arrivés ex-aequo au " + " \u{1F389}"*3
    end
    puts " "*11 + "-" *21
    puts " "*10 + "|" + " "*21 + "|"
    puts " "*10 + "|  " + "SUPER MORPION !!!".black.on_white.underline + "  |"
    puts " "*10 +"|" + " "*4 +"\u{1F534}\u{1F7E0}\u{1F7E1}\u{1F7E2}\u{1F535}\u{1F7E3}" + " "*5 + "|"
    puts " "*11 + "-"*21
    puts "\n" +"-" * 50
  end
end
