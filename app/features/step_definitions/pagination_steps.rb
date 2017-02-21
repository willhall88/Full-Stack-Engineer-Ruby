Given(/^I click "([^"]*)"$/) do |link_id|
  click_link(link_id)
end

Then(/^I should see the next page$/) do
  # first check there are #item-.. on page (incase element id is ever changed)
  expect(page.has_css?(".c-comic[id*='item-']")).to eq true
  element = first('.c-comic__wrapper')
  expect(element.has_css?('#item-0')).not_to eq true
end
