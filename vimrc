set nocompatible              " be iMproved, required
syntax enable

filetype on
filetype plugin on
filetype indent on
let g:python_host_prog = '/usr/local/bin/python2' 
let g:python3_host_prog = '/usr/local/bin/python3'


"Plug 
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat' "Repeat.vim remaps . in a way that plugins can tap into i
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
"EasyClip is a plugin for Vim which contains a collection of clipboard related functionality with the goal of 
"making using the clipboard in Vim simpler and more intuitive without losing any of its power.
Plug 'svermeulen/vim-easyclip' 
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'PeterRincker/vim-argumentative'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/vim-easy-align'
Plug 'whatyouhide/vim-gotham'
Plug 'rakr/vim-one'
Plug 'trusktr/seti.vim'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim' "EditorConfig plugin for Vim
Plug 'terryma/vim-expand-region' "visually select increasingly larger regions of text 
Plug 'tomtom/tcomment_vim' 
Plug 'morhetz/gruvbox' "gruvbox theme
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/Align' "align statements on their equal signs, make comment boxes, align comments, align declarations
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis, brackets, etc.
Plug 'sjl/gundo.vim' "Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plug 'nathanaelkane/vim-indent-guides' "Indent Guides is a plugin for visually displaying indent levels in Vim
Plug 'godlygeek/tabular' "Lign up text
Plug 'wellle/targets.vim' "Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
Plug 'wellle/visual-split.vim' "Vim plugin to control splits with visual selections or text objects
Plug 'maxbrunsfeld/vim-yankstack' "A lightweight implementation of emacs's kill-ring for vim
Plug 'justinmk/vim-sneak' "The missing motion for Vim
Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

"themes
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'kristijanhusak/vim-hybrid-material'




call plug#end()
"./Plug

"General Settings
  set hlsearch
  set incsearch
  set background=dark " for the dark version
  colorscheme hybrid_reverse
  if has("gui_running")
    set macligatures
  endif
  set termguicolors
  set autoindent " Use indentation from previous line
  set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert
  set tabstop=2
  set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
  set expandtab         " insert tab with right amount of spacing
  set shiftround        " Round indent to multiple of 'shiftwidth
  set textwidth=80
  set nowrap                          " nowrap by default
  set list                            " show invisible characters
  set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
  set number
  set numberwidth=1
  set guifont=Fira_Code:h18
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions-=e
  set backspace=indent,eol,start
  set lazyredraw
  set ruler
  set ignorecase
  set ttyfast
  set number
  set relativenumber " set line numbers relative to current line"
  set vb t_vb= "Turn Off sounds
  set incsearch         " do incremental searching
  set shell=/bin/zsh
  set swapfile 
  set dir=~/.vim/swptmp
  set cursorline!
  set linespace=8
  set nobackup " Disable backup
  set noswapfile " Disable swap file

  

"Airline options
"let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:gruvbox_contrast_dark = 0
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

"Cursor options
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode


" The default leader is \, but , is much better"
let mapleader = ','
"-----------------------------------------------------------------------------
" Indent Guides
"-----------------------------------------------------------------------------
set ts=2 sw=2 et
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"--- Split Management ----------------- "
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
let g:user_emmet_leader_key=','

"--- Mappings----------------- "
"Make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Make NERDTree easier to toggle
nmap <Leader>n :NERDTreeToggle<cr>

"Add simple highlight removal"
nmap <Leader><space> :nohlsearch<cr>

"--- ALE---------------- "
"
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\}
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'

"--- Deoplete----------------- "
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#docs = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"--- Auto Commands----------------- "

" Auto source .vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Sneak
let g:sneak#label = 1

"--- NERDTree Settings------ "
let NERDTreeHijackNetrw = 0

