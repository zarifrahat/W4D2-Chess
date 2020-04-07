require_relative "../pieces/piece.rb"
require_relative "../pieces/nullpiece.rb"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8){Array.new(8)} 

        @grid.each_with_index do |row, i|
            if [0, 1, 6, 7].include?(i)
                (0...row.length).each do |i|
                    row[i] = Piece.new
                end 
            else 
                (0...row.length).each do |i|
                    row[i] = Nullpiece.instance
                end 
            end 
        end 
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end
    
    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def valid_pos?(position)
        row, col = position
        (0..7).include?(row) && (0..7).include?(col)
    end

    def move_piece(start_pos, end_pos)
        if  self[start_pos].is_a?(Nullpiece) || !self.valid_pos?(end_pos)
            raise "Not a valid position!"
        else
            piece = self[start_pos]
            self[start_pos] = Nullpiece.instance
            self[end_pos] = piece
        end
    end

end


b = Board.new 
b.move_piece([0,0],[3,3])
p b