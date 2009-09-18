Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /^a student with login "([^\"]*)" and password "([^\"]*)" exists$/ do |login, password|
  Factory(:student, :login => login, :password => password)
end
