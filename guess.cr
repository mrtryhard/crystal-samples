# Game object
class Game
  def initialize difficulty
    # Initialize game.
    @tries = 3

    if difficulty == 1
      @max_number = 10
    elsif difficulty == 2
      @max_number = 50 
    else
      # Max level hehehe
      @max_number = 100
    end
  end # initialize

  # Match loop.
  def run 
    if @tries.nil? || @max_number.nil? 
      puts "Uninitialized game failed to start."
      return
    end

    answer = Random.rand(0..@max_number)
        
    tries = 0;
    game_end = false

    # Guess loop
    until game_end
      puts "Choose a number between 0 and #{@max_number}:"
      choice = gets.to_s.chomp 

      if answer == choice.to_i 
        # Win 
        puts "Congratulation, you found out my number (#{answer})!"
        game_end = true
      else 
        tries += 1
        puts "You used #{tries} tries on #{@tries} available."

        if tries >= @tries
          puts "You unfortunately lose this game. The answer was #{answer}"
          game_end = true;
        else
          if answer > choice.to_i 
            puts "Aim lower!"
          else
            puts "Aim higher!"
          end # answer
        end # if tries >- @tries
      end # if answer 
    end # until game_end

    puts "\r\nPress return to return home"
    gets
  end # Game.run
end # Game

# Main program - Game loop
quit = false

until quit 
  system "clear"
  puts "Guess my number !"
  puts "Please select difficulty:\r\n"
  puts "1- Easy\r\n2- Medium\r\n3- Hard\r\nQ- Quit"

  # Get user input
  choice = gets.to_s.chomp
    
  if choice.upcase == "Q"
    # Quits the game
    quit = true
  elsif ["1", "2", "3"].includes? choice
    # Start game
    game = Game.new choice.to_i
    system "clear"
    game.run
  else
    # Bad entry
    puts "You must either select a valid game difficulty or quit the game. "
    puts "Please try again (Press return to continue)"
    gets
  end # Choice
end # Main - Game loop