require 'rails_helper'

RSpec.describe Tip, type: :model do
  let(:tip) { create(:tip, tag_list: 'tag_one, tag_two') }

  it 'acts as taggable' do
    expect(tip.tag_list).to eq %w(tag_one tag_two)
  end
end