module Sudoku

	class Cell
		attr_accessor :possibilities, :row, :col

		# [1] - value of the cell. 0 == blank cell
		def initialize(value, x, y)
			@col, @row = x, y
			@box = self.box(x, y)

			if value == 0
				@possibilities = Set.new(Array(1..9))
				@value = nil
			else
				@value = value
				@possibilities = Set.new([@value])
			end
		end

		def value
			@value || 0
		end

		def solved?
			!@value.nil?
		end

		def remove_possibilities!(eliminated)
			@possibilities = @possibilities.subtract(eliminated)
		end

		def self.box(x, y)
			box_col = ((x - 1) / 3).floor + 1     # (1 / 3).floor + 1 | 1
			box_row = ((y - 1) / 3).floor + 1     # 1
			( (box_row - 1) * 3) + 1 * box_col  # 3 * 1
 		end


	end

end