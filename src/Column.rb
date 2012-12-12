#Column.rb

class Column

  attr_reader :number
  attr_accessor :contents
  
  def initialize(game, column, number)
    @number = number+1
    puts "column: " + column.inspect
    @contents = []
    column.each do |cell|
      @contents << cell
    end
  end
  
  def same_values?
    array = []
    
    self.contents.each do |cell|
      array << cell.mark
      return false if cell.empty?
    end
    
    array.uniq.length == 1
    
  end
  
  
end