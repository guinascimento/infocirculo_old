Feature: Profile
    In order to make a profile
    As an user
    I want to fill and view profile

    Scenario: Login
        Given I am on the login page
        And I follow "Cadastre-se"
        And I fill in "user[name]" with "Guilherme Nascimento"
        And I fill in "user[login]" with "guilherme"
        And I fill in "user[email]" with "javaplayer@gmail.com"
        And I fill in "user[password]" with "aaaaaa"
        And I fill in "user[password_confirmation]" with "aaaaaa"
        And I press "Sign up"
        Then I should see "Thanks for signing up! We're sending you an email with your activation code."
        And I fill in "login" with "guilherme"
        And I fill in "password" with "aaaaaa"
        Then I press "Log in"
        Then I should see "Bem vindo!"

    #Scenario: Edit Personal Information
        #Given I am on the informations page
        #And I fill in "Endereço" with "Rua das Pedras 30"
        #And I fill in "Telefone" with "21 26741321"
        #And I fill in "IM" with "javaplayer@hotmail.com"
        #And I fill in "Estado Civíl" with "1"