"
" VUNDLE CONFIG
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'maba/vim-markdown-preview'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'jnwhiteh/vim-golang'
Plugin 'slim-template/vim-slim'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ngmy/vim-rubocop'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" TypeScript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on


"
" GENERAL CONFIG
"

" enable syntax highlighting
  syntax on

" default color scheme
  set background=light
  colorscheme solarized

" font settings
  set guifont=Menlo\ Regular:h16

" don't wrap long lines
  set nowrap

" show commands as we type them
  set showcmd

" highlight matching brackets
  set showmatch

" scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

" enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

" show the first match as search strings are typed
  set incsearch

" highlight the search matches
  set hlsearch

" searching is case insensitive when all lowercase
  set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
  set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" pick up external file modifications
  set autoread

" don't abandon buffers when unloading
  set hidden

" match indentation of previous line
  set autoindent

" don't blink the cursor
  set guicursor=a:blinkon0

" show current line info (current/total)
  set ruler rulerformat=%=%l/%L

" show status line
  set laststatus=2

" augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

" flip the default split directions to sane ones
  set splitright
  set splitbelow

" don't beep for errors
  set visualbell

" make backspace work in insert mode
  set backspace=indent,eol,start

" highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

" have the mouse enabled all the time
  set mouse=a

" use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

" allow lots of tabs
  set tabpagemax=20

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


"
" FILE TYPE RECOGNITION
"

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufNewFile,BufRead *.hb set ai filetype=handlebars
au BufNewFile,BufRead *.hbs set ai filetype=handlebars
au BufNewFile,BufRead *.json set ai filetype=javascript
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.slim set filetype=slim
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir
au BufNewFile,BufRead *.rs set filetype=rust
augroup mkd
  autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
  autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
  autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
augroup END


"
" PLUGINS WITH MAPPINGS
"

" tsuquyomi (typescript)
  let g:tsuquyomi_disable_quickfix = 1
  let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Rubocop
  let g:syntastic_ruby_checkers = ["mri", "rubocop", "rubylint"]
  let g:vimrubocop_keymap = 0
  nmap <Leader>rg :RuboCop<CR>

" Silver Searcher
  nmap g/ :Ag!<space>
  nmap g* :Ag! -w <C-R><C-W><space>
  nmap ga :AgAdd!<space>
  nmap gn :cnext<CR>
  nmap gp :cprev<CR>
  nmap gq :ccl<CR>
  nmap gl :cwindow<CR>

" Tagbar
  let g:tagbar_autofocus = 1
  map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
  map <Leader>. :TagbarToggle<CR>

" Markdown preview
  map <buffer> <Leader>mp :Mm<CR>

" NERDTree
  let NERDTreeHijackNetrw = 0
  nmap gt :NERDTreeToggle<CR>

" Gundo
  map <Leader>h :GundoToggle<CR>

" Rails vim
  map <Leader>oc :Rcontroller<Space>
  map <Leader>ov :Rview<Space>
  map <Leader>om :Rmodel<Space>
  map <Leader>oh :Rhelper<Space>
  map <Leader>oj :Rjavascript<Space>
  map <Leader>os :Rstylesheet<Space>
  map <Leader>oi :Rintegration<Space>

" Surround
  " # to surround with ruby string interpolation
  let g:surround_35 = "#{\r}"
  " - to surround with no-output erb tag
  let g:surround_45 = "<% \r %>"
  " = to surround with output erb tag
  let g:surround_61 = "<%= \r %>"

" Ctrl-P Fuzzy finder
  nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
  nnoremap <Leader>t :<C-U>CtrlP<CR>
  nnoremap <Leader>T :<C-U>CtrlPTag<CR>
  let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<down>'],
    \ 'PrtSelectMove("k")':   ['<up>'],
    \ 'AcceptSelection("h")': ['<c-j>'],
    \ 'AcceptSelection("v")': ['<c-k>', '<RightMouse>'],
    \ }
  " respect the .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ["mri", "rubocop", "rubylint"]
let g:syntastic_javascript_jshint_exec = "~/node_modules/jshint/bin/jshint"
let g:syntastic_javascript_checkers = ["jshint"]

"
" KEY MAPPINGS
"

" get out of insert mode with cmd-i
  imap <D-i> <Esc>

" easy wrap toggling
  nmap <Leader>w :set wrap!<cr>
  nmap <Leader>W :set nowrap<cr>

" shortcut to save all
  nmap <Leader>ss :wa<cr>

" close all other windows (in the current tab)
  nmap gW :only<cr>

" shortcuts for frequenly used files
  nmap gs :e db/schema.rb<cr>
  nmap gr :e config/routes.rb<cr>
  nmap gm :e Gemfile<cr>

" insert blank lines without going into insert mode
  nmap go o<esc>
  nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" handy macro expansion
  iabbrev Lidsa Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
  abbrev hte the

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" select the lines which were just pasted
  nnoremap vv `[V`]

" clean up trailing whitespace
  map <Leader>c :StripTrailingWhitespaces<cr>

" compress excess whitespace on current line
  map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
  map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
  nnoremap <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
  nnoremap <S-Up> <c-w>+
  nnoremap <S-Down> <c-w>-
  nnoremap <S-Left> <c-w><
  nnoremap <S-Right> <c-w>>

" reindent the entire file
  map <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
  cmap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>
