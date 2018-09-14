" jgv .vimrc
" jgvabo@gmail.com
"
"" Load vim-plug if not present
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'Statoil/vim-e100'
Plug 'cosminadrianpopescu/vim-tail'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'gabrielelana/vim-markdown'
Plug 'plytophogy/vim-virtualenv'

" Initialize plugin system
call plug#end()

" Set colorscheme
set t_Co=256
colorscheme Tomorrow-Night
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" Leader
let mapleader      = ' '
let maplocalleader = ' '

" Autotoggle Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Toggle line number display
nnoremap <leader>l :set nonumber! norelativenumber!<cr>
set nonumber! norelativenumber!


" Toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
"
" Toggle FZF
nnoremap <leader>f :FZF<CR>

" Toggle Goyo
nnoremap <leader>g :Goyo<CR>

" Toggle Tagbar
nmap <leader>b :TagbarToggle<CR>

" Buffer movement
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>c :pclose<CR>

" Avoid indent when pasting
nmap <leader>v :set invpaste<CR>

" Various prefs
set encoding=utf-8
set nocompatible
set incsearch
set hlsearch
set ignorecase
set smartcase
set path+=**
set foldlevel=20
" Python settings 
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
let python_highlight_all=1

" Syntastic
let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" Enable e100 highlighting
au BufNewFile,BufRead *.DATA,*.SCH,*.INC,*.sch setf eclipse
au BufNewFile,BufRead *.PRT,*.LOG		setf eclipse_prt
au BufNewFile,BufRead *.tub,*.cnt,*.vol,*.ev setf schedule

" Start YouCompleteMe with only one char
let g:ycm_min_num_of_chars_for_completion = 1
map <leader>s  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>d  :YcmCompleter GetDoc<CR>

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

" SimplyFold setings
let g:SimpylFold_docstring_preview = 1

" Highlight line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

