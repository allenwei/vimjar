Feature: Init environment

  Scenario: There is no .vim folder
    Given There is not .vim folder in user home.
    When I run command "init" 
    Then I should get there is no .vim folder error

  Scenario: There is no .vimrc
    Given There is not .vimrc file in .vim
    When I run command "init" 
    Then I should get there is no .vimrc file error 

  Scenario: .vim folder is not a git repo
    Given .vim and .vimrc
    Given .vim is not git repo 
    When I run command "init" 
    Then I should get .vim is not a git repo warning 

  Scenario: .vim folder is not a git repo
    Given .vim and .vimrc
    Given .vim is not git repo 
    When I run command "init" 
    Then I should get .vim is not a git repo warning

  Scenario: there is not pathogen.vim in .vim/autoload 
    Given .vim and .vimrc
    And .vim is git repo 
    When I run command "init" 
    Then I should get install pathogen notice
    And It should install pathogen for me 

