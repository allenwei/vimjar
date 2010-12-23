Feature: Listing

  Scenario: list all posible plugin
    Given a full environment
    When I run command "list"
    Then I should see more than one plugin
