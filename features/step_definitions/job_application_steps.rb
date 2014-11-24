Given(/^Given an applicant user registered$/) do
  @browser.goto(REGISTRATION_PAGE) 
  expect(@browser.url).to match Regexp.new(REGISTRATION_PAGE)

  expect(@browser.text.include? 'Registration').to eq true

  expect(@browser.text_field(id: "user_name").present?).to eq true
  expect(@browser.text_field(id: "user_email").present?).to eq true
  expect(@browser.text_field(id: "user_password").present?).to eq true
  expect(@browser.text_field(id: "user_password_confirmation").present?).to eq true

  @browser.text_field(id: 'user_name').set "Applicant"
  @browser.text_field(id: 'user_email').set "applicant@test.com"
  @browser.text_field(id: "user_password").set "Passw0rd!"
  @browser.text_field(id: "user_password_confirmation").set "Passw0rd!"

  expect(@browser.button(value: "Create").present?).to eq true
  @browser.button(value: "Create").click
end

Given(/^I am logged in as applicant$/) do
  step 'Given an applicant user registered'
  @browser.goto(LOGIN_PAGE)
  expect(@browser.url).to match Regexp.new(LOGIN_PAGE)

  expect(@browser.text_field(id: "user_email").present?).to eq true
  expect(@browser.text_field(id: "user_password").present?).to eq true
  @browser.text_field(id: "user_email").set "applicant@test.com"
  @browser.text_field(id: "user_password").set "Passw0rd!"

  expect(@browser.button(value: "Login").present?).to eq true
  @browser.button(value: "Login").click
end

Given(/^I am at Current Job Offers page$/) do 
  @browser.goto(JOB_OFFERS_PAGE)
  expect(@browser.url).to match Regexp.new(JOB_OFFERS_PAGE)

  expect(@browser.text.include? 'Current Job Offers').to eq true
end

When(/^I apply for a "(.*?)" job offer$/) do |offer_title|
  @browser.button(value: "Apply").click
end

Then(/^I should see You have applied for: "(.*?)"$/) do |offer_title|
  @browser.divs(:class => "alert alert-success fade in").each do |div|
    div.text.include? "You have applied for: " + offer_title
  end
end

When(/^I browse to My Applications$/) do 
  @browser.goto(HOME_PAGE)
  expect(@browser.url).to match Regexp.new(HOME_PAGE)
  @browser.button :value => 'My Applications'
end

Then(/^It should list "(.*?)"$/) do |offer_title|
  @browser.text.include? offer_title
end