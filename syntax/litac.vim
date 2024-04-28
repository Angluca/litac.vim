if exists("b:current_syntax")
    finish
endif

syn keyword litacKeyword enum extends
syn keyword litacKeyword in
syn keyword litacKeyword new
syn keyword litacKeyword private
syn keyword litacKeyword super
syn keyword litacKeyword type
syn keyword litacKeyword var const
syn keyword litacInclude public

syn keyword litacInclude import export

syn keyword litacLabel case match
syn keyword litacRepeat for while
syn keyword litacStatement break continue return
syn keyword litacConditional if else

syn keyword litacType Array
syn keyword litacType bool byte
syn keyword litacType false
syn keyword litacType int
syn keyword litacType long
syn keyword litacType null
syn keyword litacType string
syn keyword litacType void true

syn match litacOperator "\v\-\>"
syn match litacOperator "\v\=\>"
syn match litacOperator "\v\:"

" adapted from neovim runtime/syntax
syn keyword litacTodo contained TODO FIXME XXX NOTE
syn region  litacComment start="/\*" end="\*/" contains=litacTodo,@Spell
syn match   litacComment "//.*$" contains=litacTodo,@Spell

syn match  litacSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  litacSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn region litacString           start=+"+ end=+"+ end=+$+ contains=litacSpecialChar,litacSpecialCharError,@Spell
syn match  litacCharacter        "'[^']*'" contains=litacSpecialChar,litacSpecialCharError
syn match  litacCharacter        "'\\''" contains=litacSpecialChar
syn match  litacCharacter        "'[^\\]'"

syn match litacNumber "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match litacNumber "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match litacNumber "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match litacNumber "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

syn match litacFloat '\v<\.?\d+([eE][+-]?\d+)?(f32|f64)?>' display
syn match litacFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?(f32|f64)>' display
syn match litacFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+(f32|f64)?>' display
" Integer literals
syn match litacInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iu](8|16|32|64)?|z)?>' display
syn match litacInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iu](8|16|32|64)?|z)?>' display
syn match litacInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iu](8|16|32|64)?|z)?>' display
syn match litacInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iu](8|16|32|64)?|z)?>' display
" Escape sequences
syn match litacEscape '\\[\\'"0abfnrtv]' contained display
syn match litacEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match litacFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=litacEscape display
syn match litacFormat '{{\|}}' contained display


hi def link litacFloat                 Number
hi def link litacInteger               Number
hi def link litacEscape                SpecialComment
hi def link litacFormat                SpecialChar

hi def link litacKeyword               Keyword
hi def link litacInclude               Include
hi def link litacLabel                 Label
hi def link litacConditional           Conditional
hi def link litacRepeat                Repeat
hi def link litacStatement             Statement
"hi def link litacType                  Type
hi def link litacNumber                Number
hi def link litacComment               Comment
hi def link litacOperator              Operator
hi def link litacCharacter             Character
hi def link litacString                String
hi def link litacTodo                  Todo
hi def link litacSpecial               Special
hi def link litacSpecialError          Error
hi def link litacSpecialCharError      Error
hi def link litacString                String
hi def link litacCharacter             Character
hi def link litacSpecialChar           SpecialChar
hi def link litacException             Exception

syn match litacType     '\(:\s*\(using\s*\)*\**\(\[.*\]\)*\)\@<=\w\([0-9a-zA-Z\* ]\)*'
syn match PreProc        '[@]'
syn match litacSymbol    '[,;]'
syn match Operator       '[\+\-\%=\/\^\&\*!?><\$|]'
syn match SpecialComment '[`:\.]'
syn match Constant       '[{}\[\]()]'
hi def litacSymbol ctermfg=DarkGray guifg=DarkGray

hi def link litacFunc Function
hi def link litacTypedef Identifier
hi def litacType ctermfg=DarkCyan guifg=DarkCyan
"hi def litacThis ctermfg=DarkMagenta guifg=DarkMagenta
hi def link litacThis Exception
syn match PreProc  '\(^\s*\[\s*\)\@<=\w\w*\ze\s*.*\]'
syn match Repeat   "\([^\.]\.\)\@<=\w\w*\(\(\[.*\]\)*\s*(\)\@!"
syn match Float    "\([0-9]\+\.\)\@<=[0-9][0-9]*\(f32\|f64\)*"
syn match litacThis '\(\w\)\@<!this\(\w\)\@!'
syn match litacType '\(\sas\s\+\W*\)\@<=\w\+'
"syn match litacType '\(\(\W\|^\)\(var\|const\|def\)\s\+[^=]*\w\s*)*\s*:\s*\W*\|^\W*\w\w*\s*:\w*\)\@<=\w\+'
syn match litacTypedef  contains=litacTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match litacFunc    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"syn keyword Keyword   def nextgroup=Function skipwhite skipempty
syn keyword litacKeyword union class struct enum namespace typedef trait nextgroup=litacTypedef skipwhite skipempty
syn keyword litacKeyword union nextgroup=litacType skipwhite skipempty contained
"syn match litacFunc    "\w\(\w\)*\ze\(\[.*\]\s*\)*\s*("
syn match litacType    "\w\(\w\)*<"he=e-1,me=e-1 " foo<T>();
"syn match litacType    "\w\(\w\)*\ze\(<.*>\s*\)*::[^<]"
syn match litacType    "\(->\s*\)\@<=\w\(\w\)*"
syn match litacFunc   "[0-9a-zA-Z_@]*\w\w*\(\(<.*>\s*\)*\(\[.*\]\)*\s*(\)\@="

syn region  litacComment start="/\*" end="\*/" contains=litacTodo,@Spell
syn match   litacComment "//.*$" contains=litacTodo,@Spell
syn region  SpecialComment start="\"\"\"" end="\"\"\"" contains=litacTodo,@Spell
syn keyword litacKeyword func using

let b:current_syntax = "litac"
