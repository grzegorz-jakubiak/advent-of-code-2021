require_relative 'depth'

puts Depth.new.count_increase(File.read('../input.txt'))