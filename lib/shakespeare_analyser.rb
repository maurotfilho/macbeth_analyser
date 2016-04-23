require 'nokogiri'

class ShakespeareAnalyser
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def run
    doc = Nokogiri::XML(xml)
    speech_items = doc.css('SPEECH')
    result = Hash.new(0)
    speech_items.map do |speech|
      speaker = speech.at('SPEAKER').text
      result[speaker] += speech.css('LINE').size
    end
    Hash[result.sort_by {|_, line_count| line_count }.reverse]
  end
end