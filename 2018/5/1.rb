def main
  str = File.readlines('i.txt')[0]
  old_str = nil
  bits = ('a'..'z').reduce([]){|b,c| b << "#{c}#{c.swapcase}"; b << "#{c.swapcase}#{c}"; b }
  rgx = Regexp.new("(#{bits.join('|')})")
  while str != old_str
    old_str = str
    str = str.gsub(rgx, '')
  end
  str.length
end

puts main
