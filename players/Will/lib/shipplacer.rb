class ShipPlacer
	def initialize board
		@board = board
	end

	def place_ship size
		orientation = rand(2)
		
		pos = rand(@board[0].length-size)
		
		if orientation == 0 
			place_ship_horizontaly size, pos
		else
			place_ship_verticaly size, pos
		end
		
	end
	
	def place_ship_horizontaly size, pos
		row = rand(@board[0].length)
		if slot_available pos, size, 'horiz', row
			for i in pos..(pos + size -1)
				@board[row][i] = true
			end
			puts [row, pos, "horizontal"]
		else
			puts 'not there!'
			place_ship size
		end
	end	
	
	def place_ship_verticaly size, pos
		column = rand(@board[0].length)
		if slot_available pos, size, 'vert', column
			for i in pos..(pos + size -1)
				@board[i][column] = true
			end
			puts [pos, column, "vertical"]
		else
			puts 'not there!'
			place_ship size
		end
	end
	
	def slot_available pos, size, orientation, staticPoint
		available = true
		for i in pos..(pos + size -1)
			if orientation == 'horiz'
				available = !(available and @board[staticPoint][i])
			else
				available = !(available and @board[i][staticPoint])
			end
		end
		return available
	end
end
