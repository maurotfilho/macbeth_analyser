require_relative '../lib/shakespeare_analyser'
require 'rspec'

describe ShakespeareAnalyser do

  describe '#run' do
    let(:analyser) { ShakespeareAnalyser.new(@xml) }

    it 'should return an empty hash for an empty document' do
      @xml = ''
      expect(analyser.run).to eq({})
    end

    it "should count the lines containing one speaker and one line" do
      @xml = '
          <PLAY>
            <SPEECH>
              <SPEAKER>Third Witch</SPEAKER>
              <LINE>That will be ere the set of sun.</LINE>
            </SPEECH>
          </PLAY>
        '
      expect(analyser.run).to eq({'Third Witch' => 1})
    end

  end
end