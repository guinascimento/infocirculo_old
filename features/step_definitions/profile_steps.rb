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

  visit "/login"
  fill_in("login", :with => "carlos")
  fill_in("password", :with => "aaaaaa")
  click_button("Log in")
  User.find_by_name("Carlos").should_not be_nil
end