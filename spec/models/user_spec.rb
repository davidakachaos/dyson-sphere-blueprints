require 'rails_helper'
# TODO Write a good test for user

describe User do
	subject(:user) { FactoryGirl.build_stubbed(:user) }

	# The relations...
	describe 'relations' do
		it { should have_many(:votes).dependent(:delete_all) }
		it { should have_many(:collections).dependent(:destroy) }
		it { should have_many(:blueprints).through(:collections) }
	end

	# The validations. If any.
	describe 'validations' do
		subject { FactoryGirl.build(:user) }
		it { should validate_uniqueness_of(:email) }
		it { should validate_acceptance_of(:password) }
		subject { FactoryGirl.build(:user) }
		it { should validate_uniqueness_of(:username) }
	end

	# See to the correct use of the DB...
	describe 'raw table' do

	end
end
