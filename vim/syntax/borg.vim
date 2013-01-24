" Vim syntax file
" Language: BORG stderr log
"
if exists("b:current_syntax")
  finish
endif

syn match borgTimeStamp '\d\{6}\.\d\{6}' nextgroup=borgSeverity skipwhite
syn match borgSeverity '\[\L\+\]'

"syn match borgComment '\L\l\+ \+[^ ,]'

"syn keyword borgCmds Display_Order Proprietary_Order cancel_pending ack
"syn keyword borgCmds sent_to_exchange canceled finished 
"syn keyword borgCmds open_on_exchange 
"syn match borgCmds '\i'

syn match borgValues '\i\+'
" Match any valid keyword preceding (but excluding) a '='
syn match borgKeys '\(\K\+\)\ze=' nextgroup=borgValues


syn region borgCite start="(" end=")" contains=borgSource,borgSouceLine
syn match borgSource contained '[a-zA-Z_]\+.cpp'
syn match borgSourceLine contained '\d\+'

hi def link borgTimeStamp Constant
hi def link borgSeverity PreProc
hi def link borgComment Comment
hi def link borgKeys Type
hi def link borgValues Constant
hi def link borgCmds Statement
hi def link borgCite PreProc
