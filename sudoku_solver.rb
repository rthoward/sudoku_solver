require_relative 'lib/solver.rb'
require 'pp'

input = STDIN.readlines
solver = Sudoku::Solver::new(input)
solver.solve
solver.dump