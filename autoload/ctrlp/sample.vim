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

let s:ctrlp_builtins = ctrlp#getvar('g:ctrlp_builtins')

function! s:get_sid_prefix() abort
  return matchstr(expand('<sfile>'), '^function \zs<SNR>\d\+_\zeget_sid_prefix$')
endfunction
let s:sid_prefix = s:get_sid_prefix()
delfunction s:get_sid_prefix

let g:ctrlp_ext_var = add(get(g:, 'ctrlp_ext_vars', []), {
      \ 'init': s:sid_prefix . 'init()',
      \ 'accept': s:sid_prefix . 'accept',
      \ 'lname': 'sample extension',
      \ 'sname': 'sample',
      \ 'type': 'path',
      \ 'nolim': 1
      \})
let s:id = s:ctrlp_builtins + len(g:ctrlp_ext_vars)
unlet s:ctrlp_builtins s:sid_prefix


function! ctrlp#sample#id() abort
  return s:id
endfunction


function! s:init() abort
  return filter(split(globpath('.', '*', 1), "\n"), 'filereadable(v:val)')
endfunction

function! s:accept(mode, str) abort
  call ctrlp#exit()
  echo len(readfile(a:str))
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
