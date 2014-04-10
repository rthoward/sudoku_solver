require 'pp'
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

if __FILE__ == $0

end