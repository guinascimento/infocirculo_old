Feature: Manage Profile
  In order to make a profile
  As an user
  I want fill and manage a profile

  Scenario: Register new user
    Given I am on the login page
    Then I follow "Cadastre-se"
    And I fill in "Nome" with "Carlos"
    And I fill in "Login" with "carlos"
    And I fill in "Email" with "carlos@gmail.com"
    And I fill in "Senha" with "123456"
    And I fill in "Confirmação da Senha" with "123456"
    And I press "Sign up"
    Then I should see "Thanks for signing up! We're sending you an email with your activation code."

  Scenario: Login
    Given I am on the login page
    Then I fill in "Login" with "Carlos"
    And I fill in "Senha" with "Carlos"
    And I press "Log in"