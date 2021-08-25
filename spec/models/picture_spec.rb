require 'rails_helper'
# TODO Write a good test for picture

describe Picture do
	subject(:picture) { FactoryGirl.build_stubbed(:picture) }

	# The relations...
	describe 'relations' do
		it { should belong_to(:blueprint) }
	end

	# The validations. If any.
	describe 'validations' do
	end

	# See to the correct use of the DB...
	describe 'raw table' do
		it { should have_db_index(:blueprint_id) }

	end
end
