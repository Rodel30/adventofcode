def main
  File.readlines('i.txt').reduce(0){|f, l|
    f.public_send(l[0], l[1..-1].to_i)
  }
end

puts main
