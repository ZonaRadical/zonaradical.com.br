Feature: Edit user
  In order to edit user
  As an logged User
  You must edit your email

    Scenario: Edit Commom User

      Given I am a regular user
      And I am signed in
      And I am at the homepage

      Given I am on first user edit page
      When I fill in "user_email" with "example@test.com"
      And I press "Update User"
      Then I should see "Your profile was successfully updated."

    Scenario: Edit Facebook or similar User
      Given I am a regular user
      Given I am a identity user
      And I am signed in
      And I am at the homepage

      Given I am on first user edit page
      Then the "user_email" field should be disabled
      And I press "Update User"
      Then I should see "Your profile was successfully updated."
