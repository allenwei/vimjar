Feature: Install
  Background:
    Given .vim and .vimrc

  Scenario: there is not pathogen.vim in .vim/autoload 
    When I successfully run command "init"
    When I run command "install"
    Then I should see "vim-fugitive" in installed list
