require 'rails_helper'
# TODO Write a good test for mod

describe Mod do
	subject(:mod) { FactoryGirl.build_stubbed(:mod) }

	# The relations...
	describe 'relations' do
		it { should have_many(:blueprints) }
	end

	# The validations. If any.
	describe 'validations' do
	end

	# See to the correct use of the DB...
	describe 'raw table' do

	end
end
