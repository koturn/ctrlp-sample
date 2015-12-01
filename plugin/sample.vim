" ============================================================================
" FILE: sample.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" DESCRIPTION: {{{
" Sample extension for ctrlp.vim
" ctrlp.vim: https://github.com/ctrlpvim/ctrlp.vim
" }}}
" ============================================================================
if exists('g:loaded_sample')
  finish
endif
let g:loaded_sample = 1
let s:save_cpo = &cpo
set cpo&vim

command! CtrlPSample  call ctrlp#init(ctrlp#sample#id())

let &cpo = s:save_cpo
unlet s:save_cpo
