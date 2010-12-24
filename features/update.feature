Feature: Update

  Scenario: Update plugins 
    Given a full environment
    When I run command "update"
    Then I should see update success message

