When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  @comics = ComicFetch.new.result_data
  expect(page).to have_content(@comics['title'])
end