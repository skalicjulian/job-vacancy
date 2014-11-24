When(/^I browse the default page$/) do
  @browser.goto(HOME_PAGE)
  expect(@browser.url).to match Regexp.new(HOME_PAGE)
end

Given(/^I access the new offer page$/) do
  @browser.goto(JOB_OFFER_CREATE_PAGE)
  expect(@browser.url).to match Regexp.new(JOB_OFFER_CREATE_PAGE)

  expect(@browser.text.include? 'New Job Offer').to eq true

  expect(@browser.text_field(id: "job_offer_title").present?).to eq true
  expect(@browser.text_field(id: "job_offer_location").present?).to eq true
  expect(@browser.text_field(id: "job_offer_description").present?).to eq true
end

Given(/^I access the job offers page$/) do
  @browser.goto(ALL_JOB_OFFERS_PAGE)
  #browsing validation
  expect(@browser.url).to match Regexp.new(ALL_JOB_OFFERS_PAGE)
  
  #header validation
  expect(@browser.text.include? 'Current Job Offers').to eq true
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  #field validation
  expect(@browser.text_field(id: "job_offer_title").present?).to eq true
  @browser.text_field(id: "job_offer_title").set offer_title
end

When(/^I confirm the new offer$/) do
  #button validation
  expect(@browser.button(value: "Create").present?).to eq true
  @browser.button(value: "Create").click
end

Then(/^I should see "(.*?)" in My Offers$/) do |offer_title|
  @browser.goto(MY_JOB_OFFERS_PAGE)
  #browsing validation
  expect(@browser.url).to match Regexp.new(MY_JOB_OFFERS_PAGE)
  
  #content validation
  expect(@browser.text.include? offer_title).to eq true
end

Then(/^I should not see "(.*?)" in My Offers$/) do |offer_title|
  @browser.goto(MY_JOB_OFFERS_PAGE)
  #browsing validation
  expect(@browser.url).to match Regexp.new(MY_JOB_OFFERS_PAGE)
  
  #content validation
  expect(@browser.text.include? offer_title).to eq false
end

Given(/^I have "(.*?)" offer in My Offers$/) do |offer_title|
  #destroy all previous offers
  step 'there is no job offers at all'
  #create a offer with offer_title
  @browser.goto(JOB_OFFER_CREATE_PAGE)
  expect(@browser.url).to match Regexp.new(JOB_OFFER_CREATE_PAGE)

  expect(@browser.text.include? 'New Job Offer').to eq true
  expect(@browser.text_field(id: "job_offer_title").present?).to eq true
  @browser.text_field(id: "job_offer_title").set offer_title
  expect(@browser.button(value: "Create").present?).to eq true
  @browser.button(value: "Create").click
  #content validation
  expect(@browser.text.include? offer_title).to eq true
end

Given(/^I edit it$/) do
  #link validation
  expect(@browser.link(text: "Edit").present?).to eq true
  @browser.link(text: "Edit").click
end

And(/^I delete it$/) do
  #button validation
  expect(@browser.button(title: "Delete offer").present?).to eq true
  @browser.button(title: "Delete offer").click
end

Given(/^I set title to "(.*?)"$/) do |offer_title|
  #field validation
  expect(@browser.text_field(id: "job_offer_title").present?).to eq true
  @browser.text_field(id: "job_offer_title").set offer_title
end

Given(/^I save the modification$/) do
  #button validation
  expect(@browser.button(value: "Save").present?).to eq true
  @browser.button(value: "Save").click
end

And(/^confirm the new offer$/) do
  #button validation
  expect(@browser.button(value: "Create").present?).to eq true
  @browser.button(value: "Create").click
end

Then(/^I should see "(.*?)"$/) do |alert_message|
  #flash alert validation
  expect(@browser.text.include? alert_message).to eq true
end