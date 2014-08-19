require 'rspec'
require 'active_record'
require 'shoulda-matchers'
require 'yaml'
require 'pry'

ATTRIBUTES = { 'name' => 'default_name'}

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

require 'employee'
require 'project'
require 'division'

RSpec.configure do |config|
  config.before(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |division| division.destroy }
    Project.all.each { |project| project.destroy }
  end
end
