"#————————————————————————————————————————
"# Summary
"#————————————————————————————————————————
"{{{
"Hierarchy -  
"Why - Expectation 
"How - Effective 
"What - Necessity to recored 
"}}} 
"#————————————————————————————————————————
"# Vim settings (UI, Format  
"#—test———————————————————————————————————————
"{{{
"source $VIMRUNTIME/mswin.vim
"behave mswin
set textwidth=80
set wrapmargin=2
set linebreak
set formatoptions=tc
setglobal spell spelllang=en_us
set nospell
set clipboard=unnamed 
"au BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex set spell
setlocal noautoindent
set paste
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=
"filetype plugin  indent on
filetype plugin  on
filetype off
syntax on
colors desert
"hi cursorline guibg=#EFF5EF
"hi CursorColumn guibg=#EFF5EF
set nopaste
set relativenumber
set splitbelow
set splitright
set history=50
set nocompatible
set autoread
set mouse+=a
set nobackup     
set nowb
set noswapfile
set magic
set sol
set sel=exclusive
set nu            
set ruler         
set showcmd       
set incsearch     
set sc
set ve=all
set mps+=<:>
set scs
set ignorecase
set smartcase
set showmatch
set nojoinspaces
set expandtab
set ts=4
set sts=4
set noet
set smarttab         
set lbr              
set si
set wrap
set wmnu
set cmdheight=2   
set laststatus=2  
set cursorline
set backspace=indent,eol,start  
set linespace=0                 
set showmatch                   
set incsearch                   
set hlsearch                    
set winminheight=0              
set ignorecase                  
set smartcase                   
set whichwrap=b,s,h,l,<,>,[,]   
set foldenable                  
set foldmethod=marker
set gdefault                    
set nowrap                      
set shiftwidth=4                
set expandtab                   
set tabstop=4                   
set softtabstop=4               
highlight clear SpellBad
highlight SpellBad cterm=underline
set paste
"}}}
"#————————————————————————————————————————
"#  Mapping   
"#————————————————————————————————————————
" {{{
let mapeader = ";"
let g:mapleader = ";"
nmap ; = :
nmap <leader>w :w!<cr>
nmap <leader>z :wq!<cr>
nmap <leader>q :q!<cr>
nmap <leader>n :wn!<cr>
nmap <leader>b :N!<cr>
nmap <leader>pre :InstantMarkdownPreview<cr>
nmap <leader>pdf :LLPStartPreview<cr>
map <leader>ss :setlocal spell!<cr>

"}}}
"#————————————————————————————————————————
"#  User Functions 
"#————————————————————————————————————————
"{{{
" Return last position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

"}}}
"#————————————————————————————————————————
"#  seting GUI 
"#————————————————————————————————————————
"{{{
if has("gui_running")
 winp 532 32
 set lines=80
 set co=120
 set guioptions=amt
 set go-=l
 set go-=L
 set go-=b
 set go+=r
 set go+=T " 툴바를 보이게 한다.
 set gfn=굴림체:h9:cHANGEUL
endif

"}}}
"#————————————————————————————————————————
"#  wildmenu  
"#————————————————————————————————————————
"{{{
set wildmenu "  push <tab>, autocompletion
set wildmode=longest,list
inoremap <C-F> <C-X><C-F>
if has("wildmenu")
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildmenu
set wildmode=longest,list
endif
"}}}
"#————————————————————————————————————————
"#  Setting Fonts 
"#————————————————————————————————————————
"{{{
if v:lang =~ "^ko"
   set encoding=cp949
   set fileencodings=utf-8,cp949
   set guifontset=-*-*-medium-r-normal--16-*-*-*-*-*-*-*
endif
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set encoding=utf-8
  set fileencodings=utf-8,cp949
endif
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"test
