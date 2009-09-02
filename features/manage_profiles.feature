Feature: Manage Profile
  In order to make a profile
  As an user
  I want fill and manage a profile
  
  Scenario: Create a Profile
    Given I am registred and logged
    Then I should see "Bem vindo!"
    
  Scenario: Fill the Summary
    Given I am registred and logged
    And I am on the profile page
    When I follow "Editar Resumo"
    Then I fill in "Resumo" with "Profissional especializado em Ruby/Rails"
    And I press "Salvar"
    Then I should see "Dados atualizados com sucesso."