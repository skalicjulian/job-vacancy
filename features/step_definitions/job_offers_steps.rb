When(/^I browse the default page$/) do
  @browser.goto("http://127.0.0.1:3000/")
end

Given(/^I access the new offer page$/) do
  @browser.goto(JOB_OFFER_CREATE_PAGE)
  @browser.text.include?("Title:").should == true
end

Given(/^I access the job offers page$/) do
  @browser.goto(ALL_JOB_OFFERS_PAGE)
  @browser.text.include? "Current Job Offers"
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  @browser.text_field(id: "job_offer_title").set offer_title
end

When(/^confirm the new offer$/) do
  @browser.button(value: "Create").click
end

Then(/^I should see "(.*?)" in My Offers$/) do |offer_title|
  @browser.goto(MY_JOB_OFFERS_PAGE)
  expect(@browser.text.include? offer_title).to eq true
end


Then(/^I should not see "(.*?)" in My Offers$/) do |offer_title|
  @browser.goto(MY_JOB_OFFERS_PAGE)
  not @browser.text.include? offer_title
end

Given(/^I have "(.*?)" offer in My Offers$/) do |offer_title|
  step 'there is no job offers at all'
  @browser.goto(JOB_OFFER_CREATE_PAGE)
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