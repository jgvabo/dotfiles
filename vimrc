" jgv .vimrc
" jgvabo@gmail.com
"
" s
"
" Load vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'jgvabo/vim-e100'
Plug 'cosminadrianpopescu/vim-tail'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Initialize plugin system
call plug#end()

" Set colorscheme
set t_Co=256
colorscheme seoul256

" Autotoggle Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" <F12> Toggle line number display
nnoremap <F12> :set nonumber!<cr>
set nonumber!

" <F11> Toggle NERDTree
nnoremap <F11> :NERDTreeToggle<CR>
"
" <F10> Toggle FZF
nnoremap <F10> :FZF<CR>

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Various prefs
set incsearch
set hlsearch
set ignorecase
set smartcase

" Python tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Enable e100 highlighting
au BufNewFile,BufRead *.DATA,*.SCH,*.INC,*.sch setf eclipse
au BufNewFile,BufRead *.PRT,*.LOG		setf eclipse_prt
au BufNewFile,BufRead *.tub,*.cnt,*.vol,*.ev setf schedule

" Start YouCompleteMe with only one char
let g:ycm_min_num_of_chars_for_completion = 1

" UltiSnips triggering
 let g:UltiSnipsExpandTrigger = '<C-j>'
 let g:UltiSnipsJumpForwardTrigger = '<C-j>'
 let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" FZF colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
