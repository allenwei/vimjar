Feature: Install

  Scenario: there is not pathogen.vim in .vim/autoload 
    Given .vim and .vimrc
    And .vim is git repo 
    When I run command "install vim-rails"
    Then I should get install pathogen notice

  Scenario: has warning if run install without plugin name 
    Given .vim and .vimrc
    And .vim is git repo 
    When I run command "init" 
    When I run command "install"
    Then I should get install command not correct error

  Scenario: install an existing plugin correctly
    Given a full environment 
    When I run command "install vim-rails"
    Then It should install "vim-rails"
    Then I should see "vim-rails" in installed list
  
  Scenario: can not install a not existed plugin  
    Given a full environment 
    When I run command "install not_existed" 
    Then I should get can not find plugin "not_existed"
