scriptencoding utf-8
if &cp || exists("g:loaded_tr")
    finish
endif
let g:loaded_tr = 1

let s:save_cpo = &cpo
set cpo&vim

" command
command! -narg=* -range Tr :<line1>,<line2>call s:Tr(<f-args>)

" Tr
function! s:Tr(...) range
    if len(a:000) == 2
        call s:Tranform(a:1, a:2, a:firstline, a:lastline)
    else
        " error
    endif
endfunction

" Tranform
function! s:Tranform(from, to, flineno, llineno)
   " replace
    let l:i = 0
    while (a:flineno + l:i) <= a:llineno
        let l:source = getline(a:flineno + l:i)
        let l:replaced = tr(l:source, a:from, a:to)
        call setline(a:flineno + l:i, l:replaced)
        let l:i += 1
    endwhile
endfunction

let &cpo = s:save_cpo
finish

==============================================================================
tr.vim : tr/from/to/
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/tr.vim
==============================================================================
author  : 小見 拓
url     : http://nanasi.jp/
email   : mail@nanasi.jp
version : 2010/10/06 23:30:00
==============================================================================
tr command.

------------------------------------------------------------------------------
:Tr from to
:'<,'>Tr from to

==============================================================================
" vim: set et ft=vim nowrap :
