When /^I log in as user "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  visit new_user_session_path
  fill_in "Login", :with => login
  fill_in "Password", :with => password
  click_button "Confirm"
end
