Feature: Pagination

In order to see all comics
As a user
I want to change pages to see more comics

Scenario: Clicking Next
When I am on the homepage
Given I click "next"
Then I should see the next page