require 'set'

module Sudoku

	class Cell
		attr_accessor :row, :col, :box, :possibilities

		# [1] - value of the cell. 0 == blank cell
		def initialize(value, x, y, possibilities = nil)
			@col, @row = x, y

			@box = Cell.box(x, y)

			if !possibilities.nil?
				@possibilities = possibilities
				return
			end

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

		def solvable?
			num_possibilities == 1
		end

		def num_possibilities
			@possibilities.size
		end

		def remove_possibilities(eliminated)
			Cell.new(@value, @col, @row, @possibilities.subtract(eliminated))
		end

		def self.box(x, y)
			box_col = ((x - 1) / 3).floor + 1
			box_row = ((y - 1) / 3).floor + 1
			( (box_row - 1) * 3) + 1 * box_col
 		end

	end

end