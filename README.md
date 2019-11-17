vim-center
==========

[![Build Status](https://travis-ci.org/eddieantonio/vim-center.svg?branch=master)](https://travis-ci.org/eddieantonio/vim-center)

Vim plugin to make **centered headings**:

[![Demo of using vim-center](https://raw.githubusercontent.com/eddieantonio/i/master/vim-center.gif)](https://asciinema.org/a/281912?t=2)


Install
-------

Use your favourite package manager:

### Pathogen <https://github.com/tpope/vim-pathogen>

    git clone https://github.com/eddieantonio/vim-center ~/.vim/bundle/vim-center

### vim-plug <https://github.com/gmarik/vundle>

    Plug 'eddieantonio/vim-center'

### Vundle <https://github.com/gmarik/vundle>

    Plugin 'eddieantonio/vim-center'


Commands
--------

There is only one command: `:CenterHeading`

Write a heading in your buffer like this:

```
This is my heading
```

Then, in normal mode, type `:CenterHeading` and press enter:

```python
########################## This is my heading ##########################
```

The delimiters are determined automatically by file type. Say I was
writing code in C and I made a heading for constants:

```c
Constants

enum {
    MY,
    WILD,
    ENUM
};
```

Use `:CenterHeading` while on the first line:

```c
/***************************** Constants ******************************/

enum {
    MY,
    WILD,
    ENUM
};
```


Mappings
--------

*vim-center* does not define any mappings by default, but
`:CenterHeading` can be mapped by using `<Plug>(center-heading)`. For
example, I have this in my `.vimrc`:

```vim
noremap <Leader>ch <Plug>(center-heading)
```


Credits
-------

Written in 2019 by Eddie Antonio Santos.
