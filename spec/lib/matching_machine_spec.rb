require 'spec_helper'

describe MatchingMachine do
  describe '.root' do
    it 'returns the root path' do
      expect(MatchingMachine.root).to eq(Pathname.new(File.expand_path('../../../lib', __FILE__)))
    end
  end
end
