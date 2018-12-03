def main
  claims = File.readlines('i.txt')
  fabric = []
  claim_sizes = []
  claims.each do |c|
    c, l, t, w, h = c.match(/^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/).captures.map(&:to_i)
    (l..(l+w-1)).each do |col|
      fabric[col] ||= []
      (t..(t+h-1)).each do |row|
        fabric[col][row] = fabric[col][row].nil? ? c : 'x'
      end
    end
    claim_sizes[c] = w*h
  end
  flat = fabric.flatten.group_by{|c| c }
  claim_sizes.each_with_index do |size, claim_number|
    return claim_number if (flat[claim_number] || []).count == size
  end
end

puts main
