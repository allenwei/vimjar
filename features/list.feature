Feature: Listing

  Scenario: list all posible plugin
    Given a full environment
    And a installed plugin "vim-fugitive"
    Then I should see "vim-fugitive" in installed list

