#Game.rb

class Game

  @over
  attr_reader :gameSize
  attr_accessor :grid
  attr_accessor :rows
  attr_accessor :rowNumber
  attr_accessor :columns
  attr_accessor :columnNumber
  attr_accessor :diagonals
  attr_accessor :diagonalNumber

  def initialize (size)
  
    @gameSize = size
    @over = false
    
    @grid = Array.new(@gameSize) {Array.new(@gameSize) {Cell.new}}
    @rows = Array.new(@gameSize) {|i| Row.new(self, @grid[i], i)}
    
    diags = [[],[]]
    @rows.each do |row|
      diags[@rows.index(row)] = @rows[@rows.index(row)]
    end
    puts "diags :" + diags.inspect
    gets
    
    cols = Array.new(@gameSize) {Array.new(@gameSize) {}}
    
    (0..@gameSize-1).each do |col|
      (0..@gameSize-1).each do |row|
        cols[col][row] = @grid[row][col]
      end
    end
    
    
    @columns = Array.new(@gameSize) {|i| Column.new(self, cols[i], i)}
    puts @rows.inspect
    
  end

  def over?
    @over
  end
  
  def output
  
    self.checkForTicTacToe
    self.draw
  
  end
  
  def draw
  
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
  
  def checkForTicTacToe
    
    @rows.each do |row|
      @rowNumber = row.number
      @over = true if row.same_values? 
    end
    
    @columns.each do |column|
      @columnNumber = column.number
      @over = true if column.same_values?
    end
    
    @diagonals.each do |diagonal|
      @diagonalNumber = diagonal.number
      @over = true if diagonal.same_values?
    end
    
    @over = true
    @grid.each do |row|
      row.each do |cell|
        @over = false if cell.empty?
      end
    end
    
    
  
  end
  
end