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

"Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'heavenshell/vim-jsdoc'

Plug 'vim-scripts/Align' "align statements on their equal signs, make comment boxes, align comments, align declarations
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis, brackets, etc.
Plug 'sjl/gundo.vim' "Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plug 'nathanaelkane/vim-indent-guides' "Indent Guides is a plugin for visually displaying indent levels in Vim
Plug 'godlygeek/tabular' "Lign up text
Plug 'wellle/targets.vim' "Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
Plug 'wellle/visual-split.vim' "Vim plugin to control splits with visual selections or text objects
Plug 'mbbill/undotree' "The ultimate undo history visualizer for VIM

Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Chun-Yang/vim-action-ag'
Plug 'farmergreg/vim-lastplace'
Plug 'digitaltoad/vim-pug'

"Formaters
Plug 'maksimr/vim-jsbeautify'
Plug 'beanworks/vim-phpfmt' 
Plug 'captbaritone/better-indent-support-for-php-with-html'

"themes
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'NLKNguyen/papercolor-theme'




call plug#end()
"./Plug

"General Settings
  set hlsearch
  set incsearch
  set background=dark " for the dark version
  colorscheme base16-default-dark
  let base16colorspace=256
  if has("gui_running")
    set macligatures
  endif
  set termguicolors
  "Indentation
  set autoindent " Use indentation from previous line
  set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert
  set tabstop=2
  set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
  set expandtab         " insert tab with right amount of spacing
  set shiftround        " Round indent to multiple of 'shiftwidth

  set list                            " show invisible characters
  set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
  set wrap                          " nowrap by default
  set linebreak
  set textwidth=120
  set colorcolumn=120

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
  set cpoptions+=$
  set virtualedit=all


"FZF
"
"
 " set fzf's default input to AG instead of find. This also removes gitignore etc
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

"function hidefzfhidden()
"  let $fzf_default_command = 'ag -g ""'
"endfunction

"function ShowFZFHidden()
"  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
"endfunction

let g:fzf_files_options =
  \ '--preview "(rougify {} || cat {}) 2> /dev/null | head -'.&lines.'"'

"Buffers
set hidden
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-p> :Files<CR>

"FZF insert mode
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"Airline options
let g:airline#extensions#tabline#enabled = 1
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
let g:indent_guides_color_change_percent = 1
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

 "open new blank file
nnoremap o<C-h> :lefta vsp new<cr>
nnoremap o<C-j> :bel sp new<cr>
nnoremap o<C-k> :abo sp new<cr>
nnoremap o<C-l> :rightb vsp new<cr>

"move window
nnoremap <Leader><C-h> <C-W>H
nnoremap <Leader><C-j> <C-W>J
nnoremap <Leader><C-k> <C-W>K
nnoremap <Leader><C-l> <C-W>L

"maximise horizontally
map <Leader>= <C-w><Bar>

"maximise vertically
map <Leader>- <C-w>_

"make all windows equally sized
map <Leader>es <C-w>=


"Emmet
let g:user_emmet_leader_key=','


"--- Mappings----------------- "
"Make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit ~/.vimrc<cr>

"Make NERDTree easier to toggle
nmap <Leader>n :NERDTreeToggle<cr>
"Revail file in tree
nmap <Leader>m :NERDTreeFind<CR>
let g:NERDTreeWinSize=50


"Add simple highlight removal"
nmap <Leader><space> :nohlsearch<cr>

"Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nnoremap <A-n> :bnext<CR>:redraw<CR>:Buffers<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:Buffers<CR>

"--- ALE---------------- "
"
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'scss': ['prettier','stylelint'],
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

"--phpfmt
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'

"undotree
nnoremap <F5> :UndotreeToggle<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


"--- Visual Bell Disable----------------- "
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

" Auto source .vimrc file on save"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"Javascript Specific
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
" augroup javascript_folding
"     au!
"     au FileType javascript setlocal foldmethod=syntax
" augroup END




"--- NERDTree Settings------ "
let NERDTreeHijackNetrw = 1

