Feature: As an Applicant I want apply for a job
  In order to get a job
  I would like to apply for a desired job offer
  And know the application was succesfull
  The job application should be visible from My Applications page

  Background:
    Given I am logged in as applicant
    Given a "Web Programmer" job offer
    Given I am at Current Job Offers page

  Scenario: Apply for a job from Current Job Offers page
    When I apply for a "Web Programmer" job offer
    Then I should see You have applied for: "Web Programmer"
    When I browse to My Applications
    Then It should list "Web Programmer"