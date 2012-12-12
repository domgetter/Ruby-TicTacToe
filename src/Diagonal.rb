#Diagonal

class Diagonal

  attr_reader :number
  attr_accessor :contents
  
  def initialize(game, diag, number)
    @number = number+1
    puts "diag: " + diag.inspect
    @contents = []
    diag.each do |cell|
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