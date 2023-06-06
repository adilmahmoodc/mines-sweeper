class BoardService

  def initialize(rows, cols, number_of_mines, board)
    @rows = rows
    @cols = cols
    @number_of_mines = number_of_mines
    @board = board
  end

  def create
    grid = Array.new(rows) { Array.new(cols, 0) }
    random_numbers = (0..((rows*cols)-1)).to_a.shuffle.take(number_of_mines)
    count = 1
    mine =  grid.each_with_index do |sub_array, index|
              sub_array.each_with_index do |item, i|
                grid[index][i] = 1 if random_numbers.include?(count)
                count += 1
              end
            end.to_json
    board.mine = mine
    board.save!
  end
  
  private
  attr_accessor :rows, :cols, :number_of_mines, :board
end
