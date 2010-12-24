Vim-Jar
=============

Provide a easy way to manage your plugin use vim plugin pathogen.

Get more detail reading my blog post: [use git submodule keep your plugin up to date](http://www.allenwei.cn/tips-using-git-submodule-keep-your-plugin-up-to-date)

Installation
-----------

    gem install vim-jar


Usage
-----

### Init your environment

  `vim-jar init` 

It will check your whether your .vim path is git repo and install pathogen

### Install partiqular plugin

  `vim-jar install PLUGIN_NAME`

### Update all plugins

  `vim-jar update`

### List all installed plguins

  `vim-jar list`

### List all avaliable plugin

  `vim-jar list`

### Import plugin to avaliable plugin list

  `vim-jar import GITHUB_URL`

It will update your local plugin database, only support github repo now.

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

Thanks 
=============

* Thanks brons_vimtools@rinspin.com port vim plugins to  github 
* Thanks [Vincent](https://github.com/linsong) help me test this gem



