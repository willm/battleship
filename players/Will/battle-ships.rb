require 'lib/shipplacer.rb'

class Player
	
	def initialize
		@board = Array.new(10) {Array.new(10){false}}
		@ships = [5, 4, 3, 3, 2]
		@shipPlacer = ShipPlacer.new @board
		@playedMoves = []
	end

	def name
		'Will M'
	end
	
	def new_game
		for i in 0..@ships.length-1
			puts '----'
			@shipPlacer.place_ship @ships[i]
		end
		#puts @board
	end
	
	def take_turn state, ships_remaining
		played = false
		while !played
			turn = [rand(@board.length),rand(@board.length)]
			if !@playedMoves.include? turn
				@playedMoves.push turn
				played = true
				return turn
			end
		end
	end
end

p = Player.new
#p.new_game
p.take_turn nil,nil
