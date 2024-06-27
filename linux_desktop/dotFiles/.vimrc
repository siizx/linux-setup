" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

" ###### Vim-Plug #####

" - Installation:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" - Config:
" Begin the plugin section
call plug#begin('~/.vim/plugged')

" List your plugins here
" -Example: 
"Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-commentary'        " A simple and effective plugin for commenting out code.
"Plug 'kien/ctrlp.vim'              " A full path fuzzy file, buffer, and MRU finder.
Plug 'vim-airline/vim-airline'     " A powerful status line plugin for Vim. (riguarda tutta la barra dove sta 'insert/normal/visual'
Plug 'tpope/vim-surround'          " Easily delete, change, and add surroundings in pairs.
Plug 'vim-syntastic/syntastic'     " A syntax checking plugin for various programming languages.
"Plug 'ycm-core/YouCompleteMe'      " A powerful code completion engine for Vim.
"Plug 'tpope/vim-fugitive'          " A Git wrapper providing Git commands and integration within Vim.
Plug 'joshdick/onedark.vim'        " Theme

" End the plugin section
call plug#end()

" After you have added your desired plugins to the ~/.vimrc file, you need to install them. Open Vim and run the following command: :PlugInstall
" Altri comandi: :PlugUpdate & :Plugclean

" #### END VIM-PLUG ####

"set runtimepath+=~/.vim/pack/vendor/start/vim-colorschemes
"colorscheme DarkDefault
colorscheme onedark
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

" -StatusBar: (Serve solo se non ho installato vim-airline)
"set laststatus=2
"set statusline=%f           " Full file path
"set statusline+=%y          " File type
"set statusline+=%r          " Read-only flag
"set statusline+=%h          " Help flag
"set statusline+=%m          " Modified flag
"set statusline+=\ [%{&ff}]  " File format
"set statusline+=\ [%l/%L]   " Line number / Total lines
"set statusline+=%p%%        " Percentage through file


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

command! FilesOpenWithFZF call Files_OpenWith_Fzf()

inoremap <c-l> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-l> <Esc>:Lex<cr>:vertical resize 30<cr>

" Disable YouCompleteMe preview window
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

set nocompatible
syntax enable
filetype plugin on
set wildmenu
set path+=**
