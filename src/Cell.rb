#Cell

class Cell

  attr_accessor :mark
  
  def initialize
    @mark = " "
  end

  def empty?
    return @mark == " "
  end
  
  def placeMark(index)
    @mark = "X" if index == 0
    @mark = "O" if index == 1
  end
  
end