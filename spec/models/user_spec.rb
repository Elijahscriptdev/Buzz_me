require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      user = User.new(name: 'last').save
      expect(user).to eq(true)
    end
  end

  describe 'associations' do
    it { should have_many(:author_articles) }
    it { should have_many(:votes) }
  end
end
