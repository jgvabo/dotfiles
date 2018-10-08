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

" Themes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
" Sensible defaults
Plug 'tpope/vim-sensible'
" Surront words with ",', <tag> etc.
Plug 'tpope/vim-surround'
" Quickly comment out lines
Plug 'tpope/vim-commentary'
" Distraction free writing
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Goyo'}
" Peek at buffers with @ and <ctrl>+r
Plug 'junegunn/vim-peekaboo'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File explorer - <leader>+t
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Tag browser - <leader>+b
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
" Semantic completion & snippets
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py', 'for': 'python' }
Plug 'SirVer/ultisnips', {'for': 'python' }
Plug 'honza/vim-snippets', {'for': 'python' }
" Fuzzy file finder - <leader>+f
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Start with MRUs
Plug 'mhinz/vim-startify'
" Git integration
Plug 'tpope/vim-fugitive'
" Highlight changes in the gutter
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
" Async linter
Plug 'w0rp/ale'
" Schlumberger Eclipse syntax
Plug 'Statoil/vim-e100'
" Better tab completion
Plug 'ervandew/supertab'
" Faster folding
Plug 'Konfekt/FastFold'
" Better folding for python
Plug 'tmhedberg/SimpylFold'
" Python virtualenv
Plug 'plytophogy/vim-virtualenv'
" Indent guides
" Plug 'nathanaelkane/vim-indent-guides'
" For working with csv files
Plug 'chrisbra/csv.vim'
" Auto close brackets
Plug 'jiangmiao/auto-pairs'
" Haskell
" Plug 'tinco/haskell.vim'

" Initialize plugin system
call plug#end()

" Set colorscheme
set t_Co=256
set background=dark
colorscheme solarized
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

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
nnoremap <leader>y :Goyo<CR>

" Toggle Tagbar
nmap <leader>b :TagbarToggle<CR>

" Buffer movement
nmap <leader>n :bnext<CR>
nmap <leader>p :bprev<CR>
nmap <leader>c :pclose<CR>

" Fast replace
nmap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Avoid indent when pasting
nmap <leader>v :set invpaste<CR>

" YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>d  :YcmCompleter GetDoc<CR>

" Signify diff
map <leader>i :SignifyToggleHighlight<CR>

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

" Ale
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

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

" SimplyFold setings
let g:SimpylFold_docstring_preview = 1

" Highlight line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

