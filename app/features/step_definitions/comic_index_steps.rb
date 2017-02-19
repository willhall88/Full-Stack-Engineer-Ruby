When(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see a list of comic book titles$/) do
  @comics = ComicFetch.new.result_data
  elements = all('.c-comic__title')
  expect(elements.length).to eq 20
end
