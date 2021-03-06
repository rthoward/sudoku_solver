require_relative './cell.rb'

module Sudoku

	class Solver

		attr_accessor :grid

		def initialize(lines)
			chars = lines.map { |line| line.chomp.split('') }.flatten

			i = -1
			@grid = chars.map { |char|
				i += 1
				Cell.new(char.to_i, (i % 9) + 1, (i / 9).floor + 1)
			}
		end

		def row(rownum)
			@grid.select { |cell| cell.row == rownum }
		end

		def col(colnum)
			@grid.select { |cell| cell.col == colnum }
		end

		def block(blocknum)
			@grid.select { |cell| cell.box == blocknum }
		end

		def eliminate(cells)
			solved_values = cells.select 	{ |cell|
				cell.solved? }.map { |cell| cell.value}
			unsolved_cells = cells.select { |cell| !cell.solved?}

			unsolved_cells.each { |cell|
				cell.remove_possibilities!(solved_values)
			}
		end

		def most_constrained
			@grid.select { |cell| !cell.solved? }.sort { |x, y|
				x.num_possibilities <=> y.num_possibilities}[0]
		end

		def solve
			until solved? do
				for i in 1..9
					eliminate(row(i))
					eliminate(col(i))
					eliminate(block(i))
				end

				most_constrained.try_solve
			end
		end

		def solved?
			@grid.select { |cell| !cell.solved? }.size == 0
		end

		def dump
			i = 0
			output = ""
			@grid.each { |cell|
				STDOUT.print cell.value
				i += 1
				puts if (i % 9) == 0
			}
		end
	end

end