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
    Then I should see "Para"
    And I should see "Carlos da Silva"
    And I should see "Contato"

  Scenario: Reply a message
    Given I am registred and logged
    And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas."
    And I follow "Inbox"
    And I follow "Create Message"
    When I select "Carlos da Silva" from "To"
    Then I fill in "Subject" with "Mensagem de contato"
    And I fill in "Body" with "Mensagem de contato interna do site"
    And I press "Send"
    Then I am on the inbox page  
    And I follow "Mensagem de contato"
    And I follow "Reply"
    Then I fill in "Body" with "Respondendo mensagem de contato."
    And I press "Send"
    Then I should see "Mensagem enviada com sucesso."

  #Scenario: Delete a message
  #  Given I am registred and logged
  #  And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas."
  #  And I follow "Inbox"
  #  And I follow "Create Message"
  #  When I select "Carlos da Silva" from "To"
  #  Then I fill in "Subject" with "Contato"
  #  And I fill in "Body" with "Mensagem de contato"
  #  And I press "Send"
  #  Then I am on the inbox page
  #  When I check "message_"
 #   And I press "Delete"
 #   Then I should see "Inbox (0)"
 
  Scenario: Sort the messages by date
    Given I am registred and logged
    And I have 1 message with subject "Seja bem vindo!" and body "InfoCirculo lhe deseja boas vindas." and date "12/09/2009"
    And I have 1 message with subject "Contato" and body "InfoCirculo Contato." and date "09/09/2009"
    And I follow "Inbox"
    Then I follow "Data"
    And I should see "Seja bem vindo"
    