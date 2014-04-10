require 'pp'
require 'set'

module Sudoku

	class Solver

		def initialize(lines)
			chars = lines.map { |line| line.chomp.split('') }
			@grid = chars.flatten.map { |value| Cell.new(value.to_i) }
		end

		def dump
			i = 0
			output = ""
			@grid.each { |cell|
				STDOUT.print (if cell.value.nil? then " " else cell.value end)
				i += 1
				puts if (i % 9) == 0
			}
		end
	end

	class Cell
		attr_accessor :possibilities, :value

		# [1] - value of the cell. 0 == blank cell
		def initialize(value)
			if value == 0
				@possibilities = Set.new(Array(1..9))
				@value = nil
			else
				@value = value
				@possibilities = Set.new([@value])
			end
		end
	end

end

if __FILE__ == $0

end