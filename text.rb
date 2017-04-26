#!/usr/bin/ruby

require "json"

require "./cube.rb"

cards = Cube::cards()

textlines = {}
textlines.default_proc = proc {0}

cards.each do |card|
	text = card['originalText']
	if text.nil?
		next
	end
	text.replace!(card['name'], "~")
	text.split("\n").each do |line|
		textlines[line] += 1
	end
end

textlines.each do |key, value|
	puts "#{value}x \t#{key}"
end

