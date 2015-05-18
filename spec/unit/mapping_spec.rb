require File.expand_path('../../spec_helper', __FILE__)

# class MappingSpec < ActiveSupport::TestCase
#   fixtures :projects, :versions, :users, :roles, :members, :member_roles, :issues, :journals, :journal_details,
#            :trackers, :projects_trackers, :issue_statuses, :enabled_modules, :enumerations, :boards, :messages,
#            :attachments, :custom_fields, :custom_fields_trackers, :custom_values, :time_entries

describe Mapping do
  let(:mapping) { FactoryGirl.create(:mapping) }

  it { should belong_to(:project) }

  describe 'validations' do
    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:tracker_project_id) }
    it { should validate_uniqueness_of(:tracker_project_id).scoped_to(:label) }
    it { should validate_presence_of(:estimations) }
    it { should validate_presence_of(:story_types) }
  end

  it('stores hash in estimations attribute') { expect(mapping.estimations['2']).to eql '4' }
  it('stores hash in story_types attribute') { expect(mapping.story_types['feature']).to eql 'Feature' }
end
