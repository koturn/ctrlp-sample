" ============================================================================
" FILE: sample.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" DESCRIPTION: {{{
" Sample extension for ctrlp.vim
" ctrlp.vim: https://github.com/ctrlpvim/ctrlp.vim
" }}}
" ============================================================================
if exists('g:loaded_ctrlp_sample') && g:loaded_ctrlp_sample
  finish
endif
let g:loaded_ctrlp_sample = 1
let s:save_cpo = &cpo
set cpo&vim

let g:ctrlp_ext_var = add(get(g:, 'ctrlp_ext_vars', []), {
      \ 'init': 'ctrlp#sample#init()',
      \ 'accept': 'ctrlp#sample#accept',
      \ 'lname': 'sample extension',
      \ 'sname': 'sample',
      \ 'type': 'path',
      \ 'nolim': 1
      \})
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)


function! ctrlp#sample#id() abort
  return s:id
endfunction


function! ctrlp#sample#init() abort
  return filter(split(globpath('.', '*', 1), "\n"), 'filereadable(v:val)')
endfunction

function! ctrlp#sample#accept(mode, str) abort
  call ctrlp#exit()
  echo len(readfile(a:str))
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
