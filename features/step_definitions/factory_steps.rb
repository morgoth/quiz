Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /^a user with login "([^\"]*)" and password "([^\"]*)" exists$/ do |login, password|
  Factory(:user, :login => login, :password => password)
end
