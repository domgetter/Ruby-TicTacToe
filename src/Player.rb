#Player.rb

class Player

  @type
  @turn

  def initialize (type = "AI")
    @type = type
  end
  
  def go (game, index)
  
    @turn = true
    
    if(@type=="AI")
      while(@turn)
        randomRow = rand(0..(game.gameSize-1))
        randomColumn = rand(0..(game.gameSize-1))
        if(game.grid[randomRow][randomColumn].empty?)
          game.grid[randomRow][randomColumn].placeMark(index)
          @turn = false
        end
      end
    else
    
    end
    
  end

end