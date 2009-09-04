Feature: Manage Profile
  In order to make a profile
  As an user
  I want fill and manage my profile
  
  Scenario: Try to create a profile without login
    Given I am on the profile page
    Then I should see "You must be logged in to access this feature."
  
  Scenario: Create a Profile
    Given I am registred and logged
    Then I should see "Bem vindo!"

  Scenario: Update the Account
    Given I am registred and logged
    And I am on the profile page
    Then I follow "Edit Account"
    When I select "Desenvolvimento de Software" from "Industry"
    And I fill in "Professional Description" with "Programador"
    And I press "Salvar"
    Then I should see "Sua conta foi atualizada com sucesso."
    
  Scenario: Update Personal Informations
    Given I am registred and logged
    And I am on the profile page
    When I follow "Edit Personal Information"
    Then I fill in "Phone" with "2126741321"
    And I fill in "Address" with "Rua das Pedras, 10"
    And I fill in "IM" with "carlos@hotmail.com"
    When I select "MSN" from "IM Type"
    When I select "Solteiro" from "Maritial Status"
    And I press "Salvar"
    Then I should see "Dados atualizados com sucesso."
    
  Scenario: Update the Summary
    Given I am registred and logged
    And I am on the profile page
    When I follow "Edit Summary"
    Then I fill in "Summary" with "Profissional especializado em Ruby/Rails"
    And I press "Salvar"
    Then I should see "Dados atualizados com sucesso."
    
  Scenario: Add a Professional Experience
    Given I am registred and logged
    And I am on the profile page
    When I follow "Add Experience"
    And I fill in "Company Name" with "Mocra"
    And I fill in "Title" with "Desenvolvedor Ruby"
    When I check "Working"
    When I select "Janeiro" from "experience_start_2i"
    When I select "2008" from "experience_start_1i"
    When I select "Dezembro" from "experience_end_2i"
    When I select "2009" from "experience_end_1i"
    Then I fill in "Description" with "Development of Ruby on Rails Projects."
    And I press "Salvar"
    Then I should see "Experiência Profissional adicionada com sucesso."