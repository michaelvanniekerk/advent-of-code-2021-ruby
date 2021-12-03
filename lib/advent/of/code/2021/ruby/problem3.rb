binary_rows = File.open("./input/problem3.txt").readlines.map { |l| l.chomp.chars }
result = binary_rows
           .transpose
           .map { |c| c.count("1") > (c.length / 2) && "1" || "0" }
           .map { |gamma| [gamma, (1 - gamma.to_i).to_s] }
           .transpose
           .map { |binary| binary.reduce(&:+).to_i(2) }
           .reduce(&:*)
puts "Part 1: #{result}"

def recurse(index, rows, inverse = false)
  one_or_zero = rows.count { |r| r[index] == "1" } >= rows.length / 2.to_f.ceil && "1" || "0"
  filtered_rows = rows.select { |r| r[index] == (inverse ? (1 - one_or_zero.to_i).to_s : one_or_zero) }
  return filtered_rows.first.reduce(&:+).to_i(2) if filtered_rows.length == 1
  recurse(index + 1, filtered_rows, inverse)
end

puts "Part 2: #{recurse(0, binary_rows) * recurse(0, binary_rows, true)}"