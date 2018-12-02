def main
  lines = File.readlines('i.txt')
  twos = 0
  threes = 0
  lines.each do |l|
    cnts = l.split('').inject(Hash.new(0)) {|cnts, c| cnts[c] += 1; cnts }
    twos += 1 if cnts.values.include?(2)
    threes += 1 if cnts.values.include?(3)
  end
  twos * threes
end

puts main
