Then(/^I should get to the search results page$/) do
  page.should have_content('Current Job Offers')
end

Then(/^I should see the "(.*?)" button$/) do |button_label|
  has_button?(button_label)
end
