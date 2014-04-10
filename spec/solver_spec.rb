require_relative '../lib/solver.rb'

describe 'Solver' do

	before :each do
		example1_path = File.expand_path('../../examples/example1', __FILE__)
		@solver = Sudoku::Solver.new(File.open(example1_path, "r").readlines)
	end

	describe '#new' do
		it "takes an array of puzzle lines and returns new Solver object" do
			@solver.should be_an_instance_of Sudoku::Solver
			@solver.grid.size.should eq 81
		end
	end

	describe '#row' do
		it "takes a row number argument and returns all cells in that row" do
			@solver.row(1).map { |cell| cell.value }.should eq [0, 8, 9, 0, 0, 7, 4, 0, 5]
		end
	end

	describe '#col' do
		it "takes a col number argument and returns all cells in that column" do
			@solver.col(3).map { |cell| cell.value }.should eq [9, 0, 0, 2, 7, 1, 0, 0, 8]
		end
	end

	describe '#eliminate' do
		it "takes a list of cells and reduces their possibilities" do
			@solver.eliminate(@solver.col(1))
			@solver.grid.at(0).possibilities.should
				eq Set.new([1, 2, 3, 4, 5, 7, 8])

			@solver.eliminate(@solver.row(1))
			@solver.grid.at(0).possibilities.should
				eq Set.new([1, 2, 3])
		end
	end

end