Feature: Manage Profile
  In order to make a profile
  As an user
  I want fill and manage a profile
  
  Scenario: Login
    Given I am registred
    Then I am on the login page
    And I fill in "Login" with "carlos"
    And I fill in "Password" with "aaaaaa"
    When I press "Log in"
    

