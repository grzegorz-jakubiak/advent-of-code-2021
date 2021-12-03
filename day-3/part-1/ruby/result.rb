require_relative 'power_consumption'

puts PowerConsumption.new.calculate(File.read('day-3/input.txt'))