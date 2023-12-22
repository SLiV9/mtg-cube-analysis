#!/usr/bin/ruby

def colorfix(colors)
	if colors.nil? || colors.empty?
		return ['C']
	end
	abbreviations = {
		'White' => 'W',
		'Blue' => 'U',
		'Black' => 'B',
		'Red' => 'R',
		'Green' => 'G',
	}
	colors = colors.map { |color| abbreviations[color] || color }
	if colors.length == 1
		return colors
	end
	canonicals = [
		['W', 'U'],
		['U', 'B'],
		['B', 'R'],
		['R', 'G'],
		['G', 'W'],
		['W', 'B'],
		['U', 'R'],
		['B', 'G'],
		['R', 'W'],
		['G', 'U'],
		['G', 'W', 'U'],
		['W', 'U', 'B'],
		['U', 'B', 'R'],
		['B', 'R', 'G'],
		['R', 'G', 'W'],
		['W', 'B', 'G'],
		['U', 'R', 'W'],
		['B', 'G', 'U'],
		['R', 'W', 'B'],
		['G', 'U', 'R'],
		['U', 'B', 'R', 'G'],
		['B', 'R', 'G', 'W'],
		['R', 'G', 'W', 'U'],
		['G', 'W', 'U', 'B'],
		['W', 'U', 'B', 'R'],
		['W', 'U', 'B', 'R', 'G']
	]
	return canonicals.select{
		|canonical| canonical.sort == colors.sort
	}[0] || colors
end
