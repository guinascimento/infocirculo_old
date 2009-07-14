Feature: Manage Profile
  In order to make a profile
  As an user
  I want fill and manage a profile
  
  Scenario: Login
    Given I am registred

  Scenario: Edit Summary
    Given I am on the summary page
    And I fill in "curriculum_summary" with "aaaaaaaaaaa"