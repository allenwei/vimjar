Feature: Install

  Scenario: install an existing plugin correctly
    Given a full environment 
    When I run command "install"
    Then I should see "vim-fugitive" in installed list
    When I run command "uninstall vim-rails" 
    Then I should not see plugin "vim-rails" in bundle home
    Then I should not see plugin "vim-rails" in .git/config
    Then I should not see plugin "vim-rails" in .gitmodules


