Feature: Analytics
  In order to know how Citygram is performing
  As a user
  I want to see subscription analytics

  Scenario: Viewing Analytics
    Given there are 200 Email Subscriptions
    And there are 150 SMS Subscriptions
    When I visit Analytics
    Then I should see '200 Email Subscriptions'
    And I should see '150 SMS Subscriptions'
