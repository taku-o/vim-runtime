scriptencoding utf-8 " {{{ {{{
if &cp || exists("g:loaded_binarymode")
    finish
endif
let g:loaded_binarymode = 1

let s:save_cpo = &cpo
set cpo&vim " }}}

" command BinaryMode {{{
command! -nargs=0 BinaryMode :call BinaryMode()
 " }}}

" function! BinaryMode() {{{
function! BinaryMode()
    if &bin == 0
        call s:SetBinaryMode()
    else
        call s:UnSetBinaryMode()
    endif
endfunction " }}}

" function! s:SetBinaryMode() {{{
function! s:SetBinaryMode()
    augroup Binary
        au!
        au BufReadPre  * let &bin=1
        au BufReadPost * if &bin | %!xxd
        au BufReadPost * set ft=xxd | endif
        au BufWritePre * if &bin | %!xxd -r
        au BufWritePre * endif
        au BufWritePost * if &bin | %!xxd
        au BufWritePost * set nomod | endif
    augroup END
    e
endfunction " }}}

" function! s:UnSetBinaryMode() {{{
function! s:UnSetBinaryMode()
    augroup Binary
        au!
    augroup END
    e
endfunction " }}}

let &cpo = s:save_cpo " {{{
finish
" }}} }}}
==============================================================================
binarymode.vim : バイナリ編集モード、通常編集モード切替
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/binarymode.vim
==============================================================================
author  : 小見 拓
url     : http://nanasi.jp/
email   : mail@nanasi.jp
version : 2009/12/19 16:00:00
==============================================================================
:BinaryModeコマンドを実行するごとに、
バイナリ編集モード、通常編集モードを切り替えます。

:BinaryMode

==============================================================================
" vim: set et ft=vim nowrap foldmethod=marker :
