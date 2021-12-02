require_relative 'coordinates'

puts Coordinates.new.calculate(File.read('day-2/input.txt'))