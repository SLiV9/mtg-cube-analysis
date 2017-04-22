#!/usr/bin/ruby

require "mtg_sdk"

cards = MTG::Set.generate_booster("ogw")

cards.each do |card|
	puts card.name
end
