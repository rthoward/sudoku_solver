require_relative '../lib/solver.rb'
require 'set'

describe 'Solver' do

	before :each do
		example1_path = File.expand_path('../../examples/example1', __FILE__)
		@solver = Sudoku::Solver.new(File.open(example1_path, "r").readlines)
	end

	describe '#new' do
		it "takes an array of puzzle lines and returns new Solver object" do
			@solver.should be_an_instance_of Sudoku::Solver
		end
	end

end

describe 'Cell' do

	describe '#new' do
		context "with a filled-in cell" do
			it "creates a new cell object with only one possibility" do
				cell = Sudoku::Cell.new(3)
				cell.value.should eq 3
				cell.possibilities.should eq Set.new([3])
			end
		end

		context "with an empty cell" do
			it "creates a new Cell object with 9 possibilities" do
				cell = Sudoku::Cell.new(0)
				cell.value.should eq nil
				cell.possibilities.should eq Set.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
			end
		end
	end

end