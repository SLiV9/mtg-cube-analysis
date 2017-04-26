#!/usr/bin/ruby

require "json"

require "./cube.rb"

cards = Cube::cards()

types = {}
types.default_proc = proc {0}
supertypes = {}
supertypes.default_proc = proc {0}
subtypes = {}
subtypes.default_proc = proc {0}

cards.each do |card|
	types[card['types']] += 1
	if not card['supertypes'].nil?
		card['supertypes'].each do |supertype|
			supertypes[supertype] += 1
		end
	end
	if not card['subtypes'].nil?
		card['subtypes'].each do |subtype|
			subtypes[subtype] += 1
		end
	end
end

puts "Types"
types.each do |key, value|
	puts "#{key}: \t#{value}"
end
puts ""

puts "Supertypes"
supertypes.each do |key, value|
	puts "#{key}: \t#{value}"
end
puts ""

puts "Subtypes"
subtypes.each do |key, value|
	puts "#{key}: \t#{value}"
end
puts ""
