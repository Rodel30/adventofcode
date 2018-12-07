def main
  base_str = File.readlines('i.txt')[0]
  bits = ('a'..'z').reduce([]){|b,c| b << "#{c}#{c.swapcase}"; b << "#{c.swapcase}#{c}"; b }
  rgx = Regexp.new("(#{bits.join('|')})")
  ('a'..'z').map{|l|
    str = base_str.gsub(Regexp.new("#{l}", true), '')
    old_str = nil
    while str != old_str
      old_str = str
      str = str.gsub(rgx, '')
    end
    [l, str.length]
  }.sort_by{|l| l[1] }[0][1]
end

puts main
