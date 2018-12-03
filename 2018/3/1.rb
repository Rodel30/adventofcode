def main
  claims = File.readlines('i.txt')
  fabric = []
  claims.each do |c|
    c, l, t, w, h = c.match(/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/).captures.map(&:to_i)
    (l..(l+w-1)).each do |col|
      fabric[col] ||= []
      (t..(t+h-1)).each do |row|
        fabric[col][row] = fabric[col][row].nil? ? c : 'x'
      end
    end
  end
  fabric.flatten.count('x')
end

puts main
