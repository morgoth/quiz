Feature: User authentication

Scenario: Successful login
  Given a student with login "johndoe" and password "secret" exists
  When I go to the login page
  And I fill in "Login" with "johndoe"
  And I fill in "Password" with "secret"
  And I press "Confirm"
  Then I should see "Login successful"