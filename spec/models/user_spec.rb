require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, :type => :model do
  describe 'abilities', :focus do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'guest user' do
      let(:user) { User.new }
      it { should be_able_to(:read, :all) }
      it { should_not be_able_to(:manage, Tour) }
    end

    context 'registered user' do
      let(:user) { create(:user) }
      it { should be_able_to(:read, :all) }
      it { should be_able_to(:create, Tour) }
      it { should_not be_able_to(:update, Tour.new) }
      
      context 'tour owner' do
        let(:tour) { create(:tour, owners: [user]) }
        let(:other_tour) { create(:tour) }
        it { should be_able_to(:update, tour) }
        it { should_not be_able_to(:update, other_tour) }
      end
    end
  end
end