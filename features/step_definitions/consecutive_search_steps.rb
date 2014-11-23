Then(/^I should get to the search results page$/) do
  @browser.text.include? 'Current Job Offers'
end

Then(/^I should see the "(.*?)" button$/) do |button_label|
  @browser.button(id: "search-button").exists?
end