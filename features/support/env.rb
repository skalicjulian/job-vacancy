require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

# require 'capybara/cucumber'
require 'rspec/expectations'
require 'watir-webdriver'
require 'headless'
require 'debugger'

require 'simplecov'
SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '..','..'))
  coverage_dir 'reports/coverage'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
end


DataMapper.auto_migrate!
user = User.create(:email => 'offerer@test.com',
									 :name => 'Offerer', 
									 :password => "Passw0rd!") unless User.all.count > 0



headless = Headless.new
headless.start

Before do |scenario|
    @browser = Watir::Browser.new
end

at_exit do
  headless.destroy
end