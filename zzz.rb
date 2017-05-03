#!/usr/bin/ruby

puts "Zeg \"wat spannend.\"".gsub(/\".*?(\.?)\"/, "\"$1\"")
