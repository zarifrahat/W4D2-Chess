require 'singleton'

class Nullpiece < Piece
    include Singleton

    def initialize
        @color = :red
        @symbol = :null
    end 
end 