require 'set'
def main
  f_vals = Set.new([0])
  f = 0
  lines = File.readlines('day1-input.txt')
  while true
    lines.each do |l|
      f = f.public_send(l[0], l[1..-1].to_i)
      if f_vals.include? f
        return f
      end
      f_vals << f
    end
  end
end

puts main
