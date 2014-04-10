require_relative '../lib/cell.rb'
require 'set'

describe 'Cell' do

	describe '#new' do
		context "with a filled-in cell" do
			it "creates a new cell object with only one possibility" do
				cell = Sudoku::Cell.new(3, 1, 1)
				cell.value.should eq 3
				cell.solved?.should eq true
				cell.possibilities.should eq Set.new([3])
			end
		end

		context "with an empty cell" do
			it "creates a new Cell object with 9 possibilities" do
				cell = Sudoku::Cell.new(0, 2, 2)
				cell.value.should eq 0
				cell.solved?.should eq false
				cell.possibilities.should eq Set.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
			end
		end
	end
end