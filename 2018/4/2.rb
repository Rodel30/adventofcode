require 'date'
def main
  logs = File.readlines('i.txt').sort_by{|l| DateTime.parse(l.match(/^\[([^\]]+)\]/).captures[0]) }
  sleeps = Hash.new{|h,k| h[k] = [] }
  guard = nil
  sleep_at = nil
  logs.each do |l|
    dt, a = l.match(/^\[([^\]]+)\] (.*)$/).captures
    case a
      when 'wakes up'
        if sleep_at.nil?
          raise 'Awoke when not asleep'
        end
        wake_at = dt[-2..-1].to_i
        sleep_at.upto(wake_at-1) do |m|
          sleeps[guard] << m
        end
        sleep_at = nil
      when 'falls asleep'
        if !sleep_at.nil?
          raise 'Fell asleep when already asleep?'
        end
        sleep_at = dt[-2..-1].to_i
      else
        guard = a.match('#(\d+) ').captures[0]
        if !sleep_at.nil?
          raise 'Unexpected state'
        end
    end
  end
  sleepiest = sleeps.map{|k,v| [k, v.group_by{|m| m }.map{|m,ms| [m, ms.count] }.sort_by{|l| l[1]}[-1] ] }.sort_by{|g| g[1][1] }[-1]
  sleepiest[0].to_i * sleepiest[1][0]
end

puts main
