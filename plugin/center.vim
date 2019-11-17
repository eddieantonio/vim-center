" ============================================================================
" File:        center.vim
" Description: vim plugin that creates a centered heading comment
" Author:      Eddie Antonio Santos
" Version:     0.1.0
"
" ============================================================================

" Script intialization section
if exists("loaded_c_center")
  finish
endif

let loaded_c_center = 1

" P.S., for n00bs like me: https://devhints.io/vimscript

function! s:CenterComment()
  " How wide should it be?
  if &l:textwidth ># 0
    let l:width = &l:textwidth
  else
    let l:width = winwidth(0)
  endif

  " &commentstring SHOULD be something like:
  " #%s -- for shell, Python, Ruby, etc.
  " /*%s*/ -- for C, JavaScript, etc.
  " Splitting it at '%s' returns one or two parts
  let l:commentchars = split(&commentstring, '%s')
  let l:begin = l:commentchars[0]

  " l:begin should be something like '/*'  or '#'
  " l:cont should be something like '*' or '#'
  " l:end should be something like '*/' or '#'
  if len(l:commentchars) ==# 1
    let l:cont = l:begin
    let l:end = l:begin
  elseif len(l:commentchars) ==# 2
    let l:cont = l:begin[1]
    let l:end = l:commentchars[1]
  else
    echoerr "Don't know how to handle commentstring: " . &commentstring
    return
  endif

  let l:current_line = line(".")
  let l:heading_text = trim(getline("."))

  " Figure out how much padding we need.
  let l:space_available = l:width
  let l:space_available = l:space_available - len(l:begin)
  let l:space_available = l:space_available - len(' ')
  let l:space_available = l:space_available - len(l:heading_text)
  let l:space_available = l:space_available - len(' ')
  let l:space_available = l:space_available - len(l:end)

  if l:space_available <=# 0
    echoerr "Not enough space!"
    return
  endif

  let l:left_space = l:space_available / 2
  "
  " Uneven space left? have an extra padding on the right.
  if l:space_available / 2.0 ># l:left_space
    let l:right_space = l:left_space + 1
  else
    let l:right_space = l:left_space
  endif

  let l:left_fill = repeat(l:cont, l:left_space)
  let l:right_fill = repeat(l:cont, l:right_space)

  let l:components = [
        \ l:begin,
        \ l:left_fill,
        \ ' ',
        \ l:heading_text,
        \ ' ',
        \ l:right_fill,
        \ l:end
        \]
  let l:comment = join(l:components, '')

  call setline(l:current_line, l:comment)
endfunction

command! CenterHeading call s:CenterComment()
