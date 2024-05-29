" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set runtimepath+=~/.vim/pack/vendor/start/vim-colorschemes
colorscheme DarkDefault
if &term =~ '256color'
  set t_Co=256
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number
set tabstop=4
set autoindent
set relativenumber
syntax on
set clipboard=unnamedplus

" My function for fzf:
function! Files_OpenWith_Fzf()
    let tmpfile = tempname()
    execute 'silent !fzf >' . tmpfile
    execute 'e ' . tmpfile
    let filenames = readfile(tmpfile)
    call delete(tmpfile)
    for filename in filenames
        execute 'e ' . filename
    endfor
endfunction
