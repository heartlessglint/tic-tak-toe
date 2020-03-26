module Choice
    def grid_choice(player)
      puts "What which square would you like to be, #{player}?"
      responce = gets.chomp.to_i
    end

  
    def user_icon(player)
      puts "What symbol do you want to be, #{player}"
      icon = gets.chomp.to_s
      icon = icon[0]
    end

  
    def player_name
      puts "What is your name"
      gets.chomp.to_s
    end

    def clash(check, other)
        if check == other
            true
        else
            false
        end
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

  
    def grid_update (square, icon)7
      check = true
      while check
        if @@grid[(square - 1)] == @player_one_icon || 
           @@grid[(square - 1)] == @player_two_icon ||
           square > 9 || 
           square < 1
            puts "That square is already taken, or you haven't chosen a grid choose again"
            square = gets.chomp.to_i
        else
          check = false
        end
      end
      count = 0
      @@grid.map do |i|
        if i == square && i.between?(1, 9) 
          @@grid[(i-1)] = icon
        else
          i
        end
      end
      for i in @@grid
        count += 1
        if count%3 != 0
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
  

    
    def check_win
        position = 0
        check = 0
        vertical = 0
        loss = true
        while check < 3
          if @@grid[position] == @@grid[(position + 1)] &&
            @@grid[(position + 1)] == @@grid[(position + 2)]
              loss = false 
          elsif @@grid[position] == @@grid[(position + 3)] &&
            @@grid[(position + 3)] == @@grid[(position + 6)]  
            loss = false    
          end
          check += 1
        end
        if @@grid[0] == @@grid[4] && 
          @@grid[4] == @@grid[8] ||
          @@grid[2] == @@grid[4] &&
          @@grid[4] == @@grid[6]
          loss = false
        end
        loss
    end

    def game_start
        create
        @player_one = player_name
        @player_one_icon = user_icon(@player_one)
        @player_two = player_name
        while clash(@player_one, @player_two)
            puts "You can't have the same name, choose another"
            @player_two = player_name
        end
        @player_two_icon = user_icon(@player_two)
        while clash(@player_one_icon, @player_two_icon)
            puts "#{@player_two} you can't have the same icon"
            player_two_icon = user_icon(@player_two)
        end
    end

    def game_loop
        game_start
        turn = 0
        while check_win
          if turn%2 == 0
            choice = grid_choice(@player_one)
            grid_update(choice, @player_one_icon)
          else 
            choice = grid_choice(@player_two)
            grid_update(choice, @player_two_icon)
          end
          turn += 1
        end
        if turn%2 != 0
            puts "Well done #{@player_one} you won the game!!"
          else 
            puts "Well done #{@player_two} you won the game!!"
          end
    end
  end
  
  
  three = Game.new
  
  three.game_loop
