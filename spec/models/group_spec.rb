require 'rails_helper'
require 'shoulda/matchers'

describe Group do

  describe 'Validations' do

    it 'has a valid factory' do
      expect(FactoryGirl.build(:group)).to be_valid
    end

    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do

    it { should have_one(:profile) }
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:users).through(:memberships) }
    it { should have_many(:users_units) }
    it { should have_many(:admins).through(:memberships) }
    it { should have_many(:waiters).through(:memberships) }
  end
end
