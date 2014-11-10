Given(/^there is no job offers at all$/) do
  JobOffer.all.destroy
end

Given(/^a "(.*?)" job offer$/) do |offer_title|
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => offer_title)
  click_button('Create')
end

When(/^I search for "(.*?)" job offer$/) do |offer_title|
  visit '/job_offers/latest'
  fill_in('text-field', :with => offer_title)
  click_button('search')
end

Then(/^I should see Total Results: "(.*?)" for "(.*?)" in Search Results$/) do |results_qtty, search_term|
  page.should have_content('Search Results')
  page.should have_content(results_qtty)
  page.should have_content(search_term)
end

Then(/^I should see the message "(.*?)" "(.*?)" in Search Results$/) do |error_message, search_term|
  page.should have_content('Search Results')
  page.should have_content(error_message)
  page.should have_content(search_term)
end