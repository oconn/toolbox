set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" A tree explorer plugin for navigating the filesystem
Plugin 'scrooloose/nerdtree'

" Comment out current line
Plugin 'scrooloose/nerdcommenter'

"Doc generator plugin"
Plugin 'heavenshell/vim-jsdoc'

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

" Javascript syntax
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" CSS syntax
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'

" Syntax Highlighting for hbs
Plugin 'mustache/vim-mustache-handlebars'

" Scala syntax
Plugin 'derekwyatt/vim-scala'

" Jade syntax
Plugin 'digitaltoad/vim-jade'

" Auto closing brakets
Plugin 'Raimondi/delimitMate'

" Dependencies for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Snippets
Plugin 'garbas/vim-snipmate'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" git wrapper
Plugin 'tpope/vim-fugitive'

" CtrlP
Plugin 'kien/ctrlp.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" emmet expanding abbreviations
Plugin 'mattn/emmet-vim'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set t_Co=256
set ttyfast
set mouse=a
set ttymouse=xterm2
set mousehide
set backspace=indent,eol,start
set clipboard=unnamed            " Use OSX clipboard in vim"

" syntax enable
syntax on
set background=dark

colorscheme distinguished
" colorscheme twilight

" Custom Commands

autocmd BufWritePre * :%s/\s\+$//e
" ==============================================================================
" Set up the silver searcher for way faster searching
" ==============================================================================
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
              \ --ignore .git
              \ --ignore .svn
              \ --ignore "*public*"
              \ --ignore "*.png"
              \ --ignore "*.jpg"
              \ --ignore "*.gif"
              \ --ignore "*test*"
              \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!

"Map leader
let mapleader= ","

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 0

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

"JS DOC Options"
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_default_mapping = 0

" Disable mulptiple cursor default
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<Leader>n'
"let g:multi_cursor_prev_key='<Leader>p'
"let g:multi_cursor_skip_key='<Leader>x'
"let g:multi_cursor_quit_key='<Esc>'

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <C-p> :CtrlP
nnoremap <C-j> 6j
nnoremap <C-k> 6k
nnoremap <S-n> :NERDTree<Esc>
nnoremap <S-d> :vsplit<Esc>
nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <S-t> :tabnew<CR>
nnoremap <Leader>g :Gdiff<CR>
nnoremap <Leader>j :%!python -m json.tool<CR>
nnoremap <Leader>p :r !pbpaste<CR>
nnoremap <Leader>c :r !pbcopy<CR>
nnoremap <Leader>y :JsDoc<CR>
nnoremap <Leader>d :split<Esc>
