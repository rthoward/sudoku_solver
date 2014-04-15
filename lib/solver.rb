require_relative './cell.rb'

module Sudoku

	def create_grid(lines)
		chars = lines.map { |line| line.chomp.split('') }.flatten

		i = -1
		@grid = chars.map { |char|
			i += 1
			Cell.new(char.to_i, (i % 9) + 1, (i / 9).floor + 1)
		}
	end

	def row(grid, rownum)
		@grid.select { |cell| cell.row == rownum }
	end

	def col(grid, colnum)
		@grid.select { |cell| cell.col == colnum }
	end

	def block(grid, blocknum)
		@grid.select { |cell| cell.box == blocknum }
	end

	def most_constrained(grid)
		grid.select { |cell| !cell.solved? }.sort { |x, y|
			x.num_possibilities <=> y.num_possibilities}[0]
	end

	def dump(grid)
		i = 0
		output = ""
		grid.each { |cell|
			STDOUT.print cell.value
			i += 1
			puts if (i % 9) == 0
		}
	end

	def values(cells)
		cells.map { |cell| cell.value }
	end
end