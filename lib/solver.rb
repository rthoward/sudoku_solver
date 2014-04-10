require 'pp'
require 'set'

module Sudoku

	class Solver


		def initialize(lines)
			chomped = lines.map { |line| line.chomp.split('') }

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
				@possibilities = Set.new(Array(1..9)).delete(@value)
			end
		end
	end

end

if __FILE__ == $0

end