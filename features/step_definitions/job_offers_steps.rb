When(/^I browse the default page$/) do
  @browser.goto("http://127.0.0.1:3000/")
end

Given(/^I access the new offer page$/) do
  @browser.goto("http://127.0.0.1:3000/job_offers/new")
  @browser.text.include?("Title:").should == true
end

Given(/^I access the job offers page$/) do
  @browser.goto("http://127.0.0.1:3000/job_offers/latest")
  @browser.text.include? "Current Job Offers"
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  @browser.text_field(id: "job_offer_title").set offer_title
end

When(/^confirm the new offer$/) do
  @browser.button(value: "Create").click
end

Then(/^I should see "(.*?)" in My Offers$/) do |content|
	@browser.goto("http://127.0.0.1:3000/job_offers/my")
  @browser.text.include?(content).should == true
end


Then(/^I should not see "(.*?)" in My Offers$/) do |content|
  @browser.goto("http://127.0.0.1:3000/job_offers/my")
  @browser.text.include?(content).should == false
end

Given(/^I have "(.*?)" offer in My Offers$/) do |offer_title|
  JobOffer.all.destroy
  @browser.goto("http://127.0.0.1:3000/job_offers/new")
  @browser.text_field(id: "job_offer_title").set offer_title
  @browser.button(value: "Create").click
end

Given(/^I edit it$/) do
  @browser.link(text: "Edit").click
end

And(/^I delete it$/) do
  @browser.button(title: "Delete offer").click
end

Given(/^I set title to "(.*?)"$/) do |new_title|
  @browser.text_field(id: "job_offer_title").set new_title
end

Given(/^I save the modification$/) do
  @browser.button(value: "Save").click
end

Then(/^I should see "(.*?)"$/) do |alert_message|
  @browser.text.include? alert_message
end
