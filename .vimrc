set nocompatible              " be iMproved, required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" A tree explorer plugin for navigating the filesystem
Plugin 'scrooloose/nerdtree'

" Comment out current line
Plugin 'scrooloose/nerdcommenter'

" Auto closing brakets
Plugin 'Raimondi/delimitMate'

" Dependencies for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Snippets
Plugin 'garbas/vim-snipmate'

" Post gists to github
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" git wrapper
Plugin 'tpope/vim-fugitive'

" CtrlP
Plugin 'kien/ctrlp.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" emmet expanding abbreviations
Plugin 'mattn/emmet-vim'

" Distraction Free writing
Plugin 'junegunn/goyo.vim'

" Typescript support
" NOTE install with pathogen `git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim`

" **************** SYNTAX ****************** "

" Syntax checking
" Plugin 'scrooloose/syntastic'

" TypeScript
Plugin 'leafgarland/typescript-vim'

" ActionScript (why? ¯\_(ツ)_/¯ because primetime...)
Plugin 'vim-scripts/Flex-Development-Support'

" Plugin 'jeroenbourgois/vim-actionscript'
" Plugin 'cespare/mxml.vim'

" Javascript

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" CSS

Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'

" Markdown

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Jade

Plugin 'digitaltoad/vim-jade'

" Swift

" Plugin 'keithbsmiley/swift.vim'
" Plugin for Cocoa/Objective-C development.
" Plugin 'msanders/cocoa.vim'

" Scala syntax

" Plugin 'derekwyatt/vim-scala'

" Clojure

Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

" Plugin 'vim-scripts/paredit.vim'

" ************ END SYNTAX ************** "

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Start pathogen
execute pathogen#infect()

filetype plugin indent on
syntax on

" Color Theme
set background=dark
colorscheme desert
let g:solarized_termcolors=256

set number
set expandtab
set ttyfast
set mouse=a
set ttymouse=xterm2
set mousehide
set backspace=indent,eol,start
set clipboard=unnamed            " Use OSX clipboard in vim"

" Start Syntastic Setup

" let g:syntastic_mode_map = { 'mode': 'active',
"                             \ 'active_filetypes': ['javascript'],
"                             \ 'passive_filetypes': [] }
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" End Syntastic Setup

" Custom Commands
autocmd BufWritePre * :%s/\s\+$//e

au! BufNewFile,BufRead *.ejs      set filetype=html
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd
au! BufNewFile,BufRead *.boot     set filetype=clojure

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

"Map leader
let mapleader= ","

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

"JS DOC Options"
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_default_mapping = 0

" Use pbcopy for gist-vim
let g:gist_clip_command = 'pbcopy'

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
nnoremap <Leader>i :Gist -p<CR>
