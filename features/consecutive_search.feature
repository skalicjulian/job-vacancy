Feature: As an Applicant I want to perform consecutive searchs by different criterias
  In order to perform a consecutive job offer search
  As an applicant
  I want to search for a job
  Get to the results page
  And be capable to make a new search with a different criteria
  
  Background
    Given I access the job offers page

  Scenario: Search for a Programmer Job Offer
    When I search for "Programmer" job offer
    And I should see Total Results: "2" for "Programmer" in Search Results
    And I should see the "search" button
    When I search for "Web" job offer
    And I should see Total Results: "1" for "Web" in Search Results