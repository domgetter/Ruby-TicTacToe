#Row.rb

class Row

  attr_reader :number
  attr_accessor :contents
  
  def initialize(game, row, number)
    @number = number+1
    puts "row: " + row.inspect
    @contents = []
    row.each do |cell|
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