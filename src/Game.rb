#Game.rb

class Game

  @over
  attr_reader :gameSize
  attr_accessor :grid

  def initialize (size)
  
    @gameSize = size
    @over = false
    @grid = Array.new(@gameSize) {Array.new(@gameSize) {Cell.new}}
    
  end

  def over?
    @over
  end
  
  def output
    
    
    fill = "   " + "|   "*(@gameSize-1)
    division = "---" + "+---"*(@gameSize-1)
    map = [fill]
    firstRow = " " + @grid[0][0].mark
    (1..(@gameSize-1)).each {|i| firstRow += " | " + @grid[0][i].mark}
    map << firstRow
    map << fill
    
    (1..(@gameSize-1)).each do |row|
      map << division
      map << fill

      currentRow = " " + @grid[row][0].mark + " "
      
      (1..(@gameSize-1)).each do |column|
        currentRow += "| " + @grid[row][column].mark + " "
      end
      
      map << currentRow
      map << fill
      
    end
  
    top = " 1   "
    (2..(@gameSize)).each do |column|
       top += column.to_s + " "*(4-(column+1).to_s.length)
     end
    map.unshift(top)
    
    letter = "A"
    (0..(map.length-1)).each do |line|
      
      if(line%4==2)
        map[line] = letter + map[line]
        map[line] = " "*(2-letter.length) + map[line]
        letter = letter.next
      else
        map[line] = "  " + map[line]
      end
      #(0..line.length).each do |index|
      #  print line[index]
      #end
    end

    puts
    map.each do |line|
      puts "\t" + line
      #(0..line.length).each do |index|
      #  print line[index]
      #end
    end
    puts
  
  end
  
end