require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category_id) }
  end

  describe 'associations' do
    it { should have_many(:votes) }
    it { should belong_to(:author) }
    it { should belong_to(:category) }
  end
end
