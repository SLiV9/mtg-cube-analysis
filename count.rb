#!/usr/bin/ruby

require "json"

require "./cube.rb"

cards = Cube::cards()

colors = {}
colors.default_proc = proc {0}

cards.each do |card|
	colors[card['colors'] || ['Colorless']] += 1
end

colors.each do |key, value|
	puts "#{key}: \t#{value}"
end

puts "Total: \t#{cards.size}"

