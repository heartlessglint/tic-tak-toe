module Choice
  def grid_choice
    puts "What which square would you like to be?"
    responce = gets.chomp.to_i
    responce
    #put in check for grid
  end

  def user_icon(player)
    puts "What symbol do you want to be, #{player}"
    gets.chomp.to_s
  end

  def player_name
    puts "What is your name"
    gets.chomp.to_s
  end
end

class Grid
  include Choice

  @@grid = []

  def create
    for i in 1..9 do
      if i%3 != 0
        @@grid << i
        print "[#{i}]"  
      else i%3 == 0 
        @@grid << i
        puts "[#{i}]"
      end
    end
  end

  def choice
    grid_choice
  end


  def grid_update (x, y) 
    @@grid.map do |i|
      if i == x && i.between?(1, 9)
        @@grid[(i-1)] = y
      else
        i
      end
    end
    for i in @@grid
      if i%3 != 0
        print "[#{i}]"
      else
        puts "[#{i}]"
      end
    end
  end

end

class Game < Grid
  @@player_one_score = 0
  @@player_two_score = 0
  @@play_game = true

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end
  
  def check_win
    @@grid.each do |x, y ,z|
      puts @@grid[x], @@grid[y], @@grid[z]
    end
  end
  
end


three = Game.new("Me", "Him")

three.create

x = three.choice
y = three.user_icon("Me")

three.grid_update(x, y)
three.check_win


#create game class that goes until a check of array 
