require 'rails_helper'
# TODO Write a good test for collection

describe Collection do
	subject(:collection) { FactoryGirl.build_stubbed(:collection) }

	# The relations...
	describe 'relations' do
		it { should belong_to(:user) }
		it { should have_many(:blueprints).dependent(:destroy) }
	end

	# The validations. If any.
	describe 'validations' do
	end

	# See to the correct use of the DB...
	describe 'raw table' do
		it { should have_db_index(:user_id) }

	end
end
