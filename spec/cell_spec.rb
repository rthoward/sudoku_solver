require_relative '../lib/cell.rb'

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

	describe 'self.box' do
		it "takes an x, y position and returns the box the cell inhabits" do
			Sudoku::Cell.box(1, 1).should eq 1
			Sudoku::Cell.box(3, 1).should eq 1
			Sudoku::Cell.box(4, 1).should eq 2
			Sudoku::Cell.box(1, 4).should eq 4
			Sudoku::Cell.box(9, 9).should eq 9
			Sudoku::Cell.box(5, 5).should eq 5
		end
	end
end