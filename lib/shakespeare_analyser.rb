require 'nokogiri'

class ShakespeareAnalyser
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def run
    {}
  end
end