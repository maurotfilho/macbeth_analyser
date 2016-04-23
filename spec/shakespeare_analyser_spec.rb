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

    it "should count the lines containing one speaker and multiple lines" do
      @xml = '
        <PLAY>
          <SPEECH>
            <SPEAKER>DUNCAN</SPEAKER>
            <LINE>What bloody man is that? He can report,</LINE>
            <LINE>As seemeth by his plight, of the revolt</LINE>
            <LINE>The newest state.</LINE>
          </SPEECH>
        </PLAY>
      '
      expect(analyser.run).to eq({'DUNCAN' => 3})
    end


  end
end