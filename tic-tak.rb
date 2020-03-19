module Choice
  def grid_choice
    puts "What which square would you like to be?"
    responce = gets.chomp
    responce
    #put in check for grid
  end

  def user_icon(player)
    puts "What symbol do you want to be, #{player}"
    gets.chomp
  end

  def player_name
    puts "What is your name"
    gets.chomp
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


  def player_chioce (x, y) 
    for i in @@grid do
      if i == x && i.between(1..9)
        i = y #not updating in array
      end
    end
    puts @@grid
  end

end

three = Grid.new

three.create

x = three.choice
y = three.user_icon("Me")

three.player_chioce(x, y)
=begin
tasks to do, create function that makes grid from updated array
create game class that goes until a check of array 
=end
