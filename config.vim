" Most credit for this vim configuration goes to Wolfy87, from where
" I 'stole' a lot of ideas for a decent vim configration
" https://github.com/Wolfy87/vim-config
"
" To activate, add the following to ~/.vimrc
" source $HOME/.vim/config.vim
"
" Add this before you include the config to enable light mode.
" let g:light_editor=1

" Add better UTF-8 support.
scriptencoding utf-8
set encoding=utf-8

" Make vim more useful. I think this drops vi compatibility.
" This allows vim to do a lot more and stray from it's roots.
set nocompatible

" Enable better indentation.
set autoindent 
" don't use smartindent (it destroys stuff???)
" set smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4
" use spaces instead of tabs
set expandtab

" enable mouse: jump to the clicked-on position
set mouse=a


" Include all of the bundle configuration.
if !exists('g:light_editor')
    source $HOME/.vim/bundles.vim
endif


"syntax highlighting:
syntax on
" filetype according to name and!! content
filetype plugin indent on

" auto read when file is changed
set autoread

"buffers are saved, can switch from unsaved buffer
set hidden

" command-line completion
set wildmenu

" partial commands
set showcmd

" hightlight searches:
set hlsearch

" ignore the case of searches
set ignorecase
" BUT use case information if there are uppercase chars
set smartcase

" show dynamically when pattern is typed
set incsearch


" disable visual alarming
" set visualbell
" Disable error bells.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" sets height of command line at the bottom
set cmdheight=1

" scroll when 3 lines from border (instead of when exactly at the border)
set scrolloff=3

" and of course! line numbering!
set number

" highlighting spaces and tabs
set list listchars=tab:»_,trail:·,precedes:<,extends:>



" hightlight overlength
set colorcolumn=81

"user interface stuff

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" show matching brackets
set showmatch

" Don't reset cursor to start of line when moving around.
set nostartofline

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Cursor:\ %l:%c

" ==================
" some key bindings
" ==================

" Set new <leader>  key to comma
" nope! use the default "\" leader key
" let mapleader = ","
" let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" close buffer without closing the current window
nmap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

" <leader> + C and <leader> + V for copy paste to clipboard in gvim
" :imap <leader>v <C-[>"+gPa
" :nmap <leader>v "+gPa
" :vmap <leader>c "+y
" :vmap <leader>x "+d


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return &filetype
endfunction


