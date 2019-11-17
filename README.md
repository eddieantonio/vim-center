vim-center
==========

[![Build Status](https://travis-ci.org/eddieantonio/vim-center.svg?branch=master)](https://travis-ci.org/eddieantonio/vim-center)

Vim plugin to make **centered headings**:

[![asciicast](https://asciinema.org/a/281912.svg)](https://asciinema.org/a/281912?t=2)

Commands
--------

There is only one command: `:CenterHeading`

Write a heading in your buffer like this:

```python
This is my heading
```

Then, in normal mode, type `:CenterHeading` and press enter:

```python
########################## This is my heading ##########################
```

The delimiters are determined automatically by file type. Say I was
writing C Code and I made a heading for constants:

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
