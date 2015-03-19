require 'rails_helper'

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
end