#!/usr/bin/ruby

require "json"

require "./cube.rb"
require "./util.rb"

colors = ARGV

cards = Cube::cards()

cmcs = {}
cmcs.default_proc = proc {0}
count = 0

cards.each do |card|
	if colors.any? && (colorfix(card['colors']) & colors).empty?
		next
	end
	cmcs[card['cmc'].to_i] += 1
	count += 1
end

pips = 100
if count < 100
	pips = count
end

puts "Manacurve"
cmcs.each do |key, value|
	puts "#{value}x \t#{key} \t" + ("#" * (value * pips / count))
end
puts ""
