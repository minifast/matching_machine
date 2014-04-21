require 'spec_helper'

describe MatchingMachine::Merger do
  let(:data) { MatchingMachine.root.join('..', 'spec', 'support', 'scholar_with_one_guide.csv') }

  subject(:merger) { MatchingMachine::Merger.import(data).first }

  describe '#scholar_email' do
    its(:scholar_email) { should include('Hi there Taco!') }
  end

  describe '#guide_emails' do
    context 'when the scholar has a single guide' do
      its(:guide_emails) { should have(1).email }

      it 'correctly addresses the first guide' do
        expect(merger.guide_emails.first).to include('Hi there Fluffy!')
      end
    end

    context 'when the scholar has two guides' do
      let(:data) { MatchingMachine.root.join('..', 'spec', 'support', 'scholar_with_two_guides.csv') }

      its(:guide_emails) { should have(2).emails }

      it 'correctly addresses the first guide' do
        expect(merger.guide_emails.first).to include('Hi there Fluffy!')
      end

      it 'correctly addresses the second guide' do
        expect(merger.guide_emails.last).to include('Hi there Delicious!')
      end
    end
  end
end
