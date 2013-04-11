#!/usr/bin/env ruby

class Twords
  attr_reader :dictionary
  def initialize(dictionary = "words.txt")
    @dictionary = dictionary
  end
  def match?(word, rack)
    w = word.split('')
    r = rack.split('')
    w == w.select { |letter| r.delete(letter) }
  end
  def matches(rack)
    File.readlines(dictionary).select { |word| match? word.rstrip, rack }
  end
end

if __FILE__ == $0
  puts "Looking for words in " + ARGV[0]
  t = Twords.new
  puts t.matches ARGV[0]
end

