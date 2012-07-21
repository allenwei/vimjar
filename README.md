[![Build Status](https://secure.travis-ci.org/allenwei/vim-jar.png)](http://travis-ci.org/allenwei/vim-jar)

Features
=============

* Provide a easy way to manage your plugin use vim plugin pathogen.
* Leverage git submodule, so you can keep your plugin up to date.
* Github submodule will make your dotfiles backup easy and fast.

Get more detail reading my blog post: [use git submodule keep your plugin up to date](http://www.allenwei.cn/tips-using-git-submodule-keep-your-plugin-up-to-date)

Installation
-----------

    gem install vim-jar


Usage
-----

### Init your environment

  `vim-jar init` 

It will check your whether your .vim path is git repo and install pathogen

### Install plugins by modify .vim/BundleFile

    plugin "git://github.com/tpope/vim-fugitive.git"

### Install plugins 

  `vim-jar install

### Open BundleFile in Editor 
  
  `vim-jar edit`

### Update all plugins

  `vim-jar update`

### List installed plugin

  `vim-jar installed`

### Uninstall plugin  

  `vim-jar uninstall PLUGIN_NAME`

### Get help 

  `vim-jar -h`

Roadmap 
=============

* Update installed plugins 
* Install from vim.org, autodetect vga, compressed plugin and folds.
* Install theme 
* Preivew theme screeshot
* Everyone contribute plugin source 
* Rank popular plugins  
* Category plugins

Troubleshooting
=============
* Git submodule error - I suggest re-install these plugins
  Like these 

  `Unable to checkout 'e53a8582a4b1fcb664779bf598de9830cc8d4613' in submodule path 'bundle/vim-ruby'
   error: More than one value for the key submodule.bundle/rails.url: git://github.com/ujihisa/quickrun.git
  `

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.  Note: the existing tests may fail
* Commit, do not mess with Rakefile, gemspec or History.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Allen Wei. See LICENSE for details.
