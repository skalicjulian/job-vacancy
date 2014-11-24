Feature: Users registration
As a new user I would like to register either to find a job or offer a job

  Background:
    Given I am at the home page
    Given a user already registered with email "marcelo@test.com"
 
  Scenario: Register as an offerer successfully
    When I click on "Want to offer a Job" link
    Then I should see the offerer registration page
    And the registration form should be empty
    When I fill the name field with "Offerer"
    And I fill the email field with "offerer@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create"
    Then I should see "User created. Now you can offer a job!"

  Scenario: Register as an applicant successfully
    When I click on "Looking for a Job" link
    Then I should see the applicant registration page
    And the registration form should be empty
    When I fill the name field with "Applicant"
    And I fill the email field with "applicant@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create" button
    Then I should see "User created. Now you can look for a job!"​

  Scenario: Could not register as an offerer, invalid email address
    When I click on "Want to offer a Job" link
    Then I should see the offerer registration page
    And the registration form should be empty
    When I fill the name field with "Offerer"
    And I fill the email field with "offerer@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create" button
    Then I should see "Invalid email address"

  Scenario: Could not register as an applicant, invalid email address
    When I click on "Looking for a Job" link
    Then I should see the applicant registration page
    And the registration form should be empty
    When I fill the name field with "Applicant"
    And I fill the email field with "applicant@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create" button
    Then I should see "Invalid email address"

  Scenario: Could not register as an offerer, email already in use
    When I click on "Want to offer a Job" link
    Then I should see the offerer registration page
    And the registration form should be empty
    When I fill the name field with "Offerer"
    And I fill the email field with "marcelo@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create" button
    Then I should see "Email already in use"

  Scenario: Could not register as an applicant, email already in use
    When I click on "Looking for a Job" link
    Then I should see the applicant registration page
    And the registration form should be empty
    When I fill the name field with "Applicant"
    And I fill the email field with "marcelo@test.com"
    And I fill the password field with "Passw0rd!"
    And I fill the password confirmation field with "Passw0rd!"
    And I click on "Create" button
    Then I should see "Email already in use"