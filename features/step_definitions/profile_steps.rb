Given /^I am registred and logged$/ do
  @user = SiteUser.create(
    :name => 'Carlos da Silva',
    :email => 'carlos@gmail.com',
    :login => 'carlos',
    :password => 'aaaaaa',
    :password_confirmation => 'aaaaaa')

  @curriculum = Curriculum.create!(:user => @user)

  unread_emails_for(current_email_address).size.should == 1
  open_email(current_email_address)
  current_email.should have_subject(/Please activate your new account./)
  click_first_link_in_email
  response.should contain(/Signup complete! Please sign in to continue./)

  visit "/login"
  fill_in("login", :with => @user.login)
  fill_in("password", :with => @user.password)
  click_button("Entrar")
end