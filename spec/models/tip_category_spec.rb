require 'rails_helper'

RSpec.describe TipCategory, type: :model do
  it_behaves_like 'slug', :name

  it { expect(subject).to validate_presence_of(:name) }
end
