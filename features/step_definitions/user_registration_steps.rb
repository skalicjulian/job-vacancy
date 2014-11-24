# encoding: utf-8
Given(/^I am at the home page$/) do
  @browser.goto(HOME_PAGE)
  expect(@browser.url).to match Regexp.new(HOME_PAGE)
end

Given(/^a user already registered with email "(.*?)"$/) do |email|
  step 'I should see the offerer registration page'
  step 'the registration form should be empty'
  @browser.text_field(:id => 'user_name').set 'Marcelo'
  @browser.text_field(:id => 'user_email').set email
  @browser.text_field(:id => 'user_password').set 'Passw0rd!'
  @browser.text_field(:id => 'user_password_confirmation').set 'Passw0rd!'
  expect(@browser.button(:value => 'Create').present?).to eq true
  @browser.button(:value => 'Create').click
end

Then(/^I should see the offerer registration page$/) do
  @browser.goto(OFFERER_REGISTRATION_PAGE)
  expect(@browser.url).to match Regexp.new(OFFERER_REGISTRATION_PAGE)

  expect(@browser.text_field(:id => 'user_name').present?).to eq true
  expect(@browser.text_field(:id => 'user_email').present?).to eq true
  expect(@browser.text_field(:id => 'user_password').present?).to eq true
  expect(@browser.text_field(:id => 'user_password_confirmation').present?).to eq true
end

Then(/^I should see the applicant registration page$/) do
  @browser.goto(APPLICANT_REGISTRATION_PAGE)
  expect(@browser.url).to match Regexp.new(APPLICANT_REGISTRATION_PAGE)

  expect(@browser.text_field(:id => 'user_name').present?).to eq true
  expect(@browser.text_field(:id => 'user_email').present?).to eq true
  expect(@browser.text_field(:id => 'user_password').present?).to eq true
  expect(@browser.text_field(:id => 'user_password_confirmation').present?).to eq true
end

Then(/^the registration form should be empty$/) do
  empty = ""  
  expect(@browser.text_field(:id => 'user_name').text).to eq empty
  expect(@browser.text_field(:id => 'user_email').text).to eq empty
  expect(@browser.text_field(:id => 'user_password').text).to eq empty
  expect(@browser.text_field(:id => 'user_password_confirmation').text).to eq empty
end

When(/^I fill the name field with "(.*?)"$/) do |name|
  expect(@browser.text_field(id: 'user_name').present?).to eq true
  @browser.text_field(id: 'user_name').set name
end

When(/^I fill the email field with "(.*?)"$/) do |email|
  expect(@browser.text_field(id: 'user_email').present?).to eq true
  @browser.text_field(id: 'user_email').set email
end

When(/^I fill the password field with "(.*?)"$/) do |password|
  expect(@browser.text_field(id: 'user_password').present?).to eq true
  @browser.text_field(id: 'user_password').set password
end

When(/^I fill the password confirmation field with "(.*?)"$/) do |password|
  expect(@browser.text_field(id: 'user_password_confirmation').present?).to eq true
  @browser.text_field(id: 'user_password_confirmation').set password
end

When(/^I click on "(.*?)"$/) do |label|
  if @browser.button(:value => label).exists?
    @browser.button(:value => label).click
  else
    @browser.link(:value => label).click
  end
end

When(/^I click on "(.*?)" button$/) do |button_label|
  expect(@browser.button(:value => button_label).present?).to eq true
  @browser.button(:value => button_label).click
end

When(/^I click on "(.*?)" link$/) do |link_label|
  expect(@browser.link(:text => link_label).present?).to eq true
  @browser.link(:text => link_label).click
end