set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://github.com/wincent/command-t'
Plugin 'taglist.vim'
Plugin 'scrooloose/NERDCommenter'
Plugin 'nvie/vim-flake8'
Plugin 'Tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'octref/RootIgnore'
Plugin 'tjennings/git-grep-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tell-k/vim-autoflake'
Plugin 'triglav/vim-visual-increment'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ignore static files
set wildignore+=*collected_static*
" make command auto-completion behave bash-alike
set wildmode=longest,list,full
set wildmenu

colorscheme jellybeans
set autoindent
set bg=dark
set colorcolumn=100
set expandtab
set hlsearch
set list
set listchars=tab:>-,trail:-
set nocompatible
set nowrap
set number
set relativenumber
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()

autocmd FileType c,cpp,python,java,bash autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType javascript autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType c,cpp,python,java,bash autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType c,cpp,python,java,bash autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType c,cpp,python,java,bash autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd BufWritePost *.py call Flake8()

" key mappings
vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
nnoremap <Leader>c :tabclose<CR>
map <F2> 105<C-W>\|
map <leader>n :set number<CR>
map <leader>es :sort<CR>

set tags=./tags;
let Tlist_WinWidth = 40
map <F4> :TlistToggle<cr>
map <leader>s :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Pathogen ... plugin manager "
" execute pathogen#infect()
" syntax on

""folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use filetype plugin indent on

"" autoflake
let g:autoflake_remove_all_unused_imports=1

