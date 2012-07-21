[![Build Status](https://secure.travis-ci.org/allenwei/vimjar.png)](http://travis-ci.org/allenwei/vimjar)

Features
=============

* Provide a easy way to manage your plugin use vim plugin pathogen.
* Leverage git submodule, so you can keep your plugin up to date.
* Github submodule will make your dotfiles backup easy and fast.

Get more detail reading my blog post: [use git submodule keep your plugin up to date](http://www.allenwei.cn/tips-using-git-submodule-keep-your-plugin-up-to-date)

Installation
-----------

  `gem install vimjar`

Usage
-----

### Init your environment

  `vimjar init` 

It will check your whether your .vim path is git repo and install pathogen

### Open BundleFile in Editor 
  
  `vimjar edit`


### Install plugins by modify .vim/BundleFile

    plugin "git://github.com/tpope/vim-fugitive.git"
    plugin "git://github.com/tpope/vim-rails.git"

### Install plugins 

  `vimjar install` or just `vimjar`


### Update all plugins

  `vimjar update`

### List installed plugin

  `vimjar installed`

### Uninstall plugin  

  `vimjar uninstall PLUGIN_NAME`

### Get help 

  `vimjar -h`

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
