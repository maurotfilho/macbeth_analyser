require 'nokogiri'

class ShakespeareAnalyser
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def run
    if !xml.empty?
      doc = Nokogiri::XML(xml)
      speech_item = doc.css('SPEECH')
      results = {}
      speaker = speech_item.at('SPEAKER').text
      lines = speech_item.css('LINE').size
      { speaker => lines }
    else
      {}
    end
  end
end