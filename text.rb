#!/usr/bin/ruby
# encoding: utf-8

require "json"

require "./cube.rb"

cards = Cube::cards()

textlines = {}
textlines.default_proc = proc {0}
keywords = {}
keywords.default_proc = proc {0}
abilitywords = {}
abilitywords.default_proc = proc {0}
costs = {}
costs.default_proc = proc {0}

cards.each do |card|
	text = card['originalText']
	if text.nil?
		next
	end
	text.gsub!(card['name'], "~")
	text.gsub!(/[ ]+\(.*\)/, "")
	lines = text.split("\n")
	# todo put in ability word
	lines = lines.map{|line| line.split(" — ")}.flatten(1)
	# todo put in costs
	lines = lines.map{|line| line.split(": ")}.flatten(1)
	lines = lines.map{|line| line.split(". ")}.flatten(1)
	lines = lines.map{|line| line.split(", ")}.flatten(1)
	lines = lines.map{|line| line.sub(".","")}
	lines = lines.map{|line| line.capitalize}
	lines.each do |line|
		textlines[line] += 1
	end
end

textlines = textlines.sort_by{|key, value| value}.reverse
textlines.each do |key, value|
	puts "#{value}x \t#{key}"
end

