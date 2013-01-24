" Vim syntax file
" Language:     Juliet's todo files
" Maintainer:   Juliet Kemp
" Last Change:  Sept 14, 2011
" Version:      1

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=:
syn case ignore

syn region todoHome start=/^h: / end=/$/
syn region todoWork start=/^w: / end=/$/
syn region todoPersonal start=/^p: / end=/$/

highlight link todoHome   Type
highlight link todoWork   String
highlight link todoPersonal Statement
