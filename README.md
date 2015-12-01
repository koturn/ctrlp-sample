ctrlp-sample
============

Sample extension for [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim).

Show files in current directory and echo the number of lines of selected file.


## Usage

```vim
:CtrlPSample
```


## Installation

### With [NeoBundle](https://github.com/Shougo/neobundle.vim)

```vim
NeoBundle 'koturn/ctrlp-sample'
```

If you want to use ```:NeoBundleLazy```, write following code in your .vimrc.

```vim
NeoBundleLazy 'koturn/ctrlp-sample'
if neobundle#tap('ctrlp-sample')
  call neobundle#config({
        \ 'depends': 'ctrlpvim/ctrlp.vim',
        \ 'autoload': {
        \   'commands': 'CtrlPSample'
        \ }
        \})
  call neobundle#untap()
endif
```

### With [Vundle](https://github.com/VundleVim/Vundle.vim)

```vim
Plugin 'koturn/ctrlp-sample'
```

### With [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'koturn/ctrlp-sample'
```

### Manual Install

If you don't want to use plugin manager, put files and directories on
```~/.vim/```, or ```%HOME%/vimfiles/``` on Windows.


## Dependent plugins

### Required

- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)


## LICENSE

This software is released under the MIT License, see [LICENSE](LICENSE).
