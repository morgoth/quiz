@sign_up
Feature: Teacher sign up

Scenario: Successful teacher sign up
  When I go to the new teacher page
  And I fill in "Login" with "johndoe"
  And I fill in "Password" with "secret"
  And I fill in "Password confirmation" with "secret"
  And I press "Confirm"
  Then I should see "Teacher created"