require 'rails_helper'

RSpec.describe Tip, type: :model do
  it_behaves_like 'slug', :title

  it { expect(subject).to validate_presence_of(:title) }
end
