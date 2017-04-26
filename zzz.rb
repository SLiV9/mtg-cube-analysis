#!/usr/bin/ruby

puts "hoi."[-1]

parts = "hoi.".split(/.$/)
parts.each do |part|
	puts part
end
