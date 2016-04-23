require 'open-uri'
require_relative 'lib/shakespeare_analyser'

text = open('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')

results = ShakespeareAnalyser.new(text.read).run

results.each do |character, line_count|
  printf("%s %s\n", line_count, character)
end