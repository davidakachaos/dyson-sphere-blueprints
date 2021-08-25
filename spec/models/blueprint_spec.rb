require 'rails_helper'
# TODO Write a good test for blueprint

describe Blueprint do
	subject(:blueprint) { FactoryGirl.build_stubbed(:blueprint) }

	# The relations...
	describe 'relations' do
		it { should have_many(:votes_for).dependent(:delete_all) }
		it { should have_many(:taggings).dependent(:destroy) }
		it { should have_many(:base_tags).through(:taggings) }
		it { should have_many(:tag_taggings).dependent(:destroy) }
		it { should have_many(:tags).through(:tag_taggings) }
		it { should have_many(:additional_pictures).dependent(:destroy) }
		it { should belong_to(:collection) }
		it { should belong_to(:mod) }
		it { should have_one(:user) }
		it { should have_rich_text(:description) }
	end

	# The validations. If any.
	describe 'validations' do
	end

	# See to the correct use of the DB...
	describe 'raw table' do
		it { should have_db_index(:collection_id) }
		it { should have_db_index(:mod_id) }

	end
end
