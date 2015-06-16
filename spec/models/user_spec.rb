require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  describe '.athletes' do
    before :each do
      @joao = create(:athlete, name: 'João', email: 'joao@mail.com')
      @zeferino = create(:athlete, name: 'Zeferino', email: 'zeferino@mail.com')
      @duda = create(:athlete, name: 'Duda', email: 'duda@mail.com')
    end

    it 'return athletes in alfabetical order' do
      expect(User.athletes.to_a).to eq([@duda, @joao, @zeferino])
    end
  end

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
      it { should be_able_to(:create, Tour.new.participants.build) }

      context 'tour owner', broken: true do
        let(:tour) { create(:tour_with_owners, users: [user]) }
        let(:other_tour) { create(:tour) }
        it { should be_able_to(:update, tour) }
        it { should_not be_able_to(:update, other_tour) }
        it { should be_able_to(:manage, tour.owners.build) }
        it { should_not be_able_to(:manage, other_tour.owners.build) }
      end
    end
  end
end
