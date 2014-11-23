Given(/^Given an applicant user registered$/) do
	@browser.goto("http://127.0.0.1:3000/register") 
	@browser.text_field(id: 'user_name').set "Applicant"
	@browser.text_field(id: 'user_email').set "applicant@test.com"
  	@browser.text_field(id: "user_password").set "Passw0rd!"
  	@browser.text_field(id: "user_password_confirmation").set "Passw0rd!"
  	@browser.button(value: "Create").click
end

Given(/^I am logged in as applicant$/) do
	step 'Given an applicant user registered'
	@browser.goto("http://127.0.0.1:3000/")
	@browser.link(:text => "Login").click
	@browser.text_field(id: "user_email").set "applicant@test.com"
  	@browser.text_field(id: "user_password").set "Passw0rd!"
  	@browser.button(value: "Login").click
end

Given(/^I am at Current Job Offers page$/) do 
  @browser.goto("http://127.0.0.1:3000/job_offers/latest")
end

When(/^I apply for a "(.*?)" job offer$/) do |offer_title|
  @browser.link(id: "applybtn").click
end

Then(/^I should see You have applied for: "(.*?)"$/) do |offer_title|
	@browser.text.include? "You have applied for:"
	@browser.text.include? offer_title
end

When(/^I browse to My Applications$/) do 
	@browser.goto("http://127.0.0.1:3000")
	@browser.button :value => 'My Applications'
end

Then(/^It should list "(.*?)"$/) do |offer_title|
	@browser.text.include? offer_title
end


