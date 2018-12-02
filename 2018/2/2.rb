def main
  lines = File.readlines('i.txt')
  lines.count.times do |n|
    l = lines[n]
    ((n+1)..(lines.count-1)).each do |n2|
      l2 = lines[n2]
      if l2.length == l.length
        diff = []
        l.length.times do |cn|
          if l[cn] != l2[cn]
            diff << cn
          end
        end
        if diff.count == 1
          str = l.dup
          str.slice!(diff[0])
          return str
        end
      end
    end
  end
end

puts main

def better
  lines = File.readlines('i.txt')
  lines.count.times do |n|
    l = lines[n]
    ((n+1)..(lines.count-1)).each do |n2|
      l2 = lines[n2]
      if l2.length == l.length
        diffs = l.length.times.reject{|cn| l[cn] == l2[cn] }
        return l.tap{|s| s.slice! diffs[0] } if diffs.count == 1
      end
    end
  end
end

puts better

def betterer
  lines = File.readlines('i.txt')
  lines.product(lines).each do |l, l2|
    if l2.length == l.length
      diffs = l.length.times.reject{|cn| l[cn] == l2[cn] }
      return l.tap{|s| s.slice! diffs[0] } if diffs.count == 1
    end
  end
end

puts betterer
