Given(/^there is no job offers at all$/) do
  JobOffer.all.destroy
end

Given(/^I am logged in as an offerer$/) do
  @browser.goto(LOGIN_PAGE)
  expect(@browser.url).to match Regexp.new(LOGIN_PAGE)
  
  print (@browser.url + "\n")
  
  expect(@browser.text.include? 'Login').to eq true
  expect(@browser.text_field(id: "user_email").present?).to eq true
  expect(@browser.text_field(id: "user_password").present?).to eq true
  @browser.text_field(id: "user_email").set "offerer@test.com"
  @browser.text_field(id: "user_password").set "Passw0rd!"
  expect(@browser.button(value: "Login").present?).to eq true
  @browser.button(value: "Login").click
end

Given(/^a "(.*?)" job offer$/) do |offer_title|
  @browser.goto(JOB_OFFER_CREATE_PAGE)
  expect(@browser.url).to match Regexp.new(JOB_OFFER_CREATE_PAGE)
  
  print (@browser.url + "\n")
 
  expect(@browser.text.include? 'New Job Offer').to eq true
  @browser.text_field(id: "job_offer_title").set offer_title
  @browser.button(value: "Create").click
end

When(/^I search for "(.*?)" job offer$/) do |offer_title|
  @browser.goto(ALL_JOB_OFFERS_PAGE)
  expect(@browser.url).to match Regexp.new(ALL_JOB_OFFERS_PAGE)
  
  print (@browser.url + "\n")

  expect(@browser.text.include? 'Current Job Offers').to eq true
  expect(@browser.text_field(id: "text-field").present?).to eq true
  @browser.text_field(id: "text-field").set offer_title
  expect(@browser.button(id: "search-button").present?).to eq true
  @browser.button(id: "search-button").click
end

Then(/^I should see Total Results: "(.*?)" for "(.*?)" in Search Results$/) do |results_qtty, search_term|
  expect(@browser.text.include? 'Current Job Offers').to eq true
  expect(@browser.text.include? results_qtty).to eq true
  expect(@browser.text.include? search_term).to eq true
end

Then(/^I should see the message "(.*?)" "(.*?)" in Search Results$/) do |error_message, search_term|
  expect(@browser.text.include? 'Current Job Offers').to eq true
  expect(@browser.text.include? error_message).to eq true
  expect(@browser.text.include? search_term).to eq true
end