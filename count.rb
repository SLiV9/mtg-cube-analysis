#!/usr/bin/ruby

require "json"

require "./cube.rb"
require "./util.rb"

cards = Cube::cards()

colors = {}
colors.default_proc = proc {0}

cards.each do |card|
	if (card['type'] == 'Land')
		colors["(Land)"] += 1
	else
		colors[colorfix(card['colors'])] += 1
	end
end

colors.each do |key, value|
	puts "#{value}x \t#{key}"
end

puts "Total: \t#{cards.size}"

