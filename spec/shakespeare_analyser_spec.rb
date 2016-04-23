require_relative '../lib/shakespeare_analyser'
require 'rspec'

describe ShakespeareAnalyser do

  describe '#run' do
    let(:analyser) { ShakespeareAnalyser.new(@xml) }

    it 'should return an empty hash for an empty document' do
      @xml = ''
      expect(analyser.run).to eq({})
    end

  end
end