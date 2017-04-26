#!/usr/bin/ruby

require "mtg_sdk"
require "json"

module Cube

	def self.cardnames()

		cardnames = []

		File.open("cube.txt").each do |line|
			line.strip!
			if line.empty?
				next
			end
			if line.start_with?("//")
				next
			end
			cardnames << line
		end

		return cardnames
	end

	def self.cards()

		cards = []

		cardnames().each do |cardname|

			filename = "cache/" + cardname + ".json"

			if File.file?(filename)
				File.open(filename).each do |line|
					cards << JSON.parse(line)
				end
				next
			end

			print "Downloading #{cardname}... \t"

			results = MTG::Card
					.where(name: cardname)
					.where(pageSize: 1)
					.all

			# todo choose which result to take
			card = results[0]

			File.open(filename, 'w') do |line|
				line.puts card.to_json
			end

			print "OK\n"

			cards << JSON.parse(card.to_json)
		end

		return cards
	end

end
