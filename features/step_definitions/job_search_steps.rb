Given(/^there is no job offers at all$/) do
  JobOffer.all.destroy
end

Given(/^I am logged in as an offerer$/) do
  @browser.goto("http://127.0.0.1:3000/login")
  @browser.text_field(id: "user_email").set "offerer@test.com"
  @browser.text_field(id: "user_password").set "Passw0rd!"
  @browser.button(value: "Login").click
end

Given(/^a "(.*?)" job offer$/) do |offer_title|
  @browser.goto("http://127.0.0.1:3000/job_offers/new")
  @browser.text_field(id: "job_offer_title").set offer_title
  @browser.button(value: "Create").click
end

When(/^I search for "(.*?)" job offer$/) do |offer_title|
  @browser.goto("http://127.0.0.1:3000/job_offers/latest")
  @browser.text_field(id: "text-field").set offer_title
  @browser.button(value: "search").click
end

Then(/^I should see Total Results: "(.*?)" for "(.*?)" in Search Results$/) do |results_qtty, search_term|
  @browser.text.include? 'Current Job Offers'
  @browser.text.include? results_qtty
  @browser.text.include? search_term
end

Then(/^I should see the message "(.*?)" "(.*?)" in Search Results$/) do |error_message, search_term|
  @browser.text.include? 'Current Job Offers'
  @browser.text.include? error_message
  @browser.text.include? search_term
end