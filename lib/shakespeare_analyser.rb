require 'nokogiri'

class ShakespeareAnalyser
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def run
    doc = Nokogiri::XML(xml)
    speaker_item = doc.at('SPEAKER')
    if speaker_item
      speaker = speaker_item.text
      { speaker => 1 }
    else
      {}
    end
  end
end