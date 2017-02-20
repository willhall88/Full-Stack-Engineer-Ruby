When(/^I am on the homepage$/) do
  visit '/'
  @comics = ComicFetch.new.result_data
end

Then(/^I should see a list of comic book titles$/) do
  elements = all('.c-comic__title')
  expect(elements.length).to eq 15
end

Then(/^I should see each comics cover picture$/) do
  elements = all('.c-comic__cover-image')
  expect(elements.length).to eq 15
end