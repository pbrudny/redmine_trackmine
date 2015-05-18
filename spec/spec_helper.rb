# Load test_helper from Redmine main project
require File.expand_path(File.dirname(__FILE__) + '/../../../test/test_helper')
require 'bundler'
Bundler.setup(:default, :spec)
require 'factory_girl'
require 'rack/test'

# load factories manually. Otherwise load it from redmine app.
# if (!FactoryGirl.factories || FactoryGirl.factories.empty?)
  Dir.glob(File.dirname(__FILE__) + "/factories/*.rb").each do |factory|
    require factory
  end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.include FactoryGirl::Syntax::Methods
end

def json_path(fixture)
  File.dirname(__FILE__) + "/fixtures/#{fixture}.json"
end


def fixtures
  %i(
      users
      email_addresses
      projects
      custom_fields
      custom_fields_projects
      custom_fields_trackers
      custom_values
      trackers
      projects_trackers
      issue_statuses
      issue_priorities
      issues
      mappings
    )
end

ActiveRecord::FixtureSet.create_fixtures(File.dirname(__FILE__) + '/fixtures/', fixtures)
