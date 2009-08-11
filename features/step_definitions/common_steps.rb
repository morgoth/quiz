When /^I set hidden field "([^\"]*)" to "([^\"]*)"$/  do |field, value|
  set_hidden_field(field, :to => value)
end

Given /^"([^\"]*)" is logged in$/ do |login|
  password = "secret"
  Given %Q{a user with login "#{login}" and password "#{password}" exists}
  When %Q{I log in as user "#{login}" with password "#{password}"}
end
