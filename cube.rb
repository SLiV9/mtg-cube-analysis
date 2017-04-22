#!/usr/bin/ruby

require "mtg_sdk"

cardnames = []

File.open("cube.txt").each do |line|
	line.strip!
	if line.empty?
		next
	end
	if line.start_with? "//"
		next
	end
	cardnames << line
end

cardnames.each do |cardname|

	filename = "cache/" + cardname + ".json"

	if File.file? filename
		next
	end

	print "Downloading #{cardname}... \t"

	cards = MTG::Card
			.where(name: cardname)
			.where(pageSize: 1)
			.all

	card = cards[0]

	File.open(filename, 'w') do |line|
		line.puts card.to_json
	end

	print "OK\n"
end
