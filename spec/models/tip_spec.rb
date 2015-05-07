require 'rails_helper'

RSpec.describe Tip, type: :model do
  let(:tip) { create(:tip, title: 'A simple title') }

  it { expect(subject).to validate_presence_of(:title) }

  context 'when create a new tip' do
    it 'generates a slug based on the title' do
      expect(tip.slug).to eq 'a-simple-title'
    end
  end
end
