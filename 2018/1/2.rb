require 'set'
def main
  f_vals = Set.new([0])
  f = 0
  lines = File.readlines('i.txt')
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

def better
  f_vals = Set.new([0])
  f = 0
  lines = File.readlines('i.txt')
  while true
    lines.each do |l|
      f += l.to_i
      return f if f_vals.include? f
      f_vals << f
    end
  end
end

puts better
