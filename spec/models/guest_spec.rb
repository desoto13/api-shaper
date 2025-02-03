require 'rails_helper'

RSpec.describe Guest, type: :model do
  let!(:guest) { Guest.create(email: 'test@example.com', id_number: '123456') }

  describe 'Associations' do
    it { should have_many(:reservations) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:id_number) }
  end
end
