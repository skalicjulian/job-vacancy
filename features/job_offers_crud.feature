Feature: Job Offers CRUD
  In order to get employees
  As a job offerer
  I want to manage my offers

  Background:
  	Given I am logged in as an offerer

  Scenario: Create new offer
    Given I access the new offer page
    When I fill the title with "Java Programmer"
		And confirm the new offer    
    Then I should see "Offer created"
    And I should see "Java Programmer" in My Offers

  Scenario: Update offer
    Given I have "Java Programmer" offer in My Offers
    And I edit it
    And I set title to "Senior Java Programmer"
    And I save the modification
    Then I should see "Offer updated"
    And I should see "Senior Java Programmer" in My Offers

  Scenario: Delete offer
    Given I have "Java Programmer" offer in My Offers
    Given I delete it
    Then I should see "Offer deleted"
    And I should not see "Java Programmer" in My Offers
