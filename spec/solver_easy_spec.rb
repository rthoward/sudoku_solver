require_relative '../lib/solver.rb'
require 'pp'
include Sudoku

describe 'Solver' do

	before :each do
		easy1_path = File.expand_path('../../examples/easy1', __FILE__)
		@grid = create_grid(File.open(easy1_path, "r").readlines)
	end

	describe 'create_grid' do
		it 'takes an array of lines and returns a new grid obj' do
			@grid.size.should eq 81
		end
	end

	describe 'row' do
		it 'returns the given row of the given grid' do
			values(row(@grid, 1)).should eq [0, 8, 9, 0, 0, 7, 4, 0, 5]
		end
	end

	describe 'col' do
		it 'returns the given column of the given grid' do
			values(col(@grid, 3)).should eq [9, 0, 0, 2, 7, 1, 0, 0, 8]
		end
	end

	describe 'block' do
		it 'returns the given block of the given grid' do
			values(block(@grid, 1)).should eq [0, 8, 9, 0, 0, 0, 0, 7, 0]
			values(block(@grid, 9)).should eq [0, 7, 0, 0, 0, 0, 5, 1, 0]
		end
	end

end