directions = File.open("./input/problem2.txt").readlines

totals = directions.map { |line| line.split(" ") }
                   .reduce(Hash.new(0)) { |r, d| r.merge({ d[0] => d[1].to_i }) { |_, o, n| o + n } }
puts "Part1: #{totals["forward"] * (totals["down"] - totals["up"])}"

def handle_direction(direction, amount, totals)
  case direction
  when 'forward'
    totals['horizontal'] += amount
    totals['depth'] += (totals['aim'] * amount)
  when "down"
    totals['aim'] += amount
  when "up"
    totals['aim'] -= amount
  end
end

totals = Hash.new(0)
directions.map { |line| line.split(" ") }
          .each { |d, amount| handle_direction(d, amount.to_i, totals) }
puts "Part2: #{totals["horizontal"] * totals["depth"]}"