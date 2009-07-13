Given /^I am registred$/ do
  @current_user = SiteUser.create!(
    :name => 'Carlos',
    :email => 'guilherme.ruby@gmail.com',
    :login => 'carlos',
    :password => 'aaaaaa',
    :password_confirmation => 'aaaaaa'
  )

  unread_emails_for(current_email_address).size.should == 1
  open_email(current_email_address)
  current_email.should have_subject(/Please activate your new account./)
  click_first_link_in_email
  response.should contain(/Signup complete! Please sign in to continue./)

  #fill_in("Login", :with => @current_user.login)
  #fill_in("Senha", :with => @current_user.password)
  #click_button("Login")
  #response.should contain("Bem vindo!")
end