Feature: Manage Inbox
  In order to manage a inbox
  As an user
  I want view, delete and send messages

  Scenario: View messages
    Given I am registred and logged
    And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas."
    And I follow "Inbox"
    Then I should see "Inbox (1)"
    And I should see "Carlos da Silva"
    And I should see "Seja bem vindo!"

  Scenario: Create a message
    Given I am registred and logged
    And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas."
    And I follow "Inbox"
    And I follow "Create Message"
    When I select "Carlos da Silva" from "To"
    Then I fill in "Subject" with "Contato"
    And I fill in "Body" with "Mensagem de contato"
    And I press "Send"
    Then I should see "De"
    And I should see "Carlos da Silva"
    And I should see "Contato"
    
  Scenario: Delete a message
    Given I am registred and logged
    And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas."
    And I follow "Inbox"
    And I follow "Create Message"
    When I select "Carlos da Silva" from "To"
    Then I fill in "Subject" with "Contato"
    And I fill in "Body" with "Mensagem de contato"
    And I press "Send"
    Then I am on the inbox page
    When I check "Message"
    And press "Delete"
    Then I should see "Inbox (0)"
    