Feature: Job Offer Search Results
  In order to know the results for a job offer search
  As a candidate
  I want to search for a job
  And know either the total results or see the message "No results available" for that search term

  Background:
  	Given there is no job offers at all
  	Given a "Web Programmer" job offer
  	Given a "Java Programmer" job offer
    Given I access the job offers page

  Scenario: Search for a Programmer Job Offer
    When I search for "Programmer" job offer
    Then I should see Total Results: "2" for "Programmer" in Search Results

  Scenario: Search for a Smalltalk Job Offer
    When I search for "Smalltalk" job offer
    Then I should see the message "No results available for:" "Smalltalk" in Search Results