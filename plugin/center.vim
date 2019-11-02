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

" P.S., for n00bs: https://devhints.io/vimscript

" That is what I programmed, and it's terrible!
function! s:CenterComment()
  " TODO: figure out current comment char
  " TODO: when lang has both beginning and end chars,
  "       use them both.

  " This implements it how I typically do it manually:
  "
  " - Type the name of the section header
  " - -> :center<CR>
  " - -> 0
  " - replace the beginning with comment characters ->  vwhhr#
  " - copy it -> yaW
  " move to end, paste it -> $p


  " Center the text first
  center
  " Then replace the beginning with the comment leader.
  normal! 0vwhhr#
  " Copy it...
  normal! yaW
  " Then append it to the end
  execute "normal A "
  normal! $p
endfunction

command! CenterHeading call s:CenterComment()
