depths = File.open("./input/problem1.txt").readlines.map(&:chomp).map(&:to_i)
part1 = (1..depths.length-1).map { |i| depths[i] > depths[i-1] && 1 || 0}.reduce(&:+)
puts "Part1: #{part1}"


part2 = (0..depths.length-4).map { |i| depths[i+3] > depths[i] && 1 || 0}.reduce(&:+)
puts "Part2: #{part2}"