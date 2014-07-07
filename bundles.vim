" Load Vundle (https://github.com/gmarik/vundle)
" to install vundle:
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


"========================================
"  Add custom bundles from here:
"========================================


" general plugins

" nerdtree: a filebrowser
Bundle 'scrooloose/nerdtree'
" add a shortcut to toggle the NERDtree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>


" use tagbar instead of taglist
Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>t :TagbarToggle<CR>
" load all additional tag types
source $HOME/.vim/tags.vim

" Unite - for fast file/buffer searching & switching
Bundle 'Shougo/unite.vim'
nnoremap <silent> <leader>f :Unite file<CR>
" TODO maybe add vimproc here for async recursive search
nnoremap <silent> <leader>r :Unite file_rec<CR>
nnoremap <silent> <leader>b :Unite buffer<CR>


" detect ident
Bundle 'tpope/vim-sleuth'


" Undo Tree visualization
Bundle 'sjl/gundo.vim'
nnoremap <silent> <leader>u :GundoToggle<CR>
" configure gundo:
let g:gundo_width = 30
let g:gundo_preview_height = 10
let g:gundo_right = 1
let g:gundo_preview_bottom = 1


" checks syntax
Bundle 'scrooloose/syntastic'
" always show the error list at the bottom of the screen
let g:syntastic_always_populate_loc_list=1
" configure syntastic for python to use also use PEP8
let g:syntastic_python_checkers=['python', 'pep8']


" automatic completion
Bundle 'Valloric/YouCompleteMe'
" Configure YouCompleteMe.
let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
" use the YCM default clang flags config in case none is set
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" function for checking if the current file is supported
function! Ycm_supports_file()
    let cur_ft = &filetype
    let supported_ft = 0
    for ft in ['c', 'cpp', 'objc', 'objcpp', 'python', 'cs']
        if ft == cur_ft
            let supported_ft = 1
        endif
    endfor
    return supported_ft
endfunction
" uses the Ycm goto declaration or the vim 'gD', depending
" on whether the current file type is supported by Ycm
function! Ycm_goto_decl()
    if Ycm_supports_file()
        exec "YcmCompleter GoToDefinitionElseDeclaration"
    else
        call feedkeys('gD')
    endif
endfunction
" map the previous function to leader + D
nnoremap <leader>D :call Ycm_goto_decl()<CR>


" Ag (replacement for Ack): for super fast recursive code searching
Bundle 'rking/ag.vim'
" execute :Ag on the current word under the cursor
nnoremap <leader>s :Ag <C-R><C-W><CR>


" MiniBufExplorer: the proper method to handle "tabs", because vim tabs
"                  are not really tabs at all
"  MiniBufExplorer is not needed with the vim-airline tabline extension
Bundle 'fholgado/minibufexpl.vim'
" configure MinBufExplorer:
" fast buffer switching
nnoremap  <C-l> :bn<CR>
nnoremap  <C-h> :bp<CR>
nnoremap  <leader>1 :1b<CR>
nnoremap  <leader>2 :2b<CR>
nnoremap  <leader>3 :3b<CR>
nnoremap  <leader>4 :4b<CR>
nnoremap  <leader>5 :5b<CR>
nnoremap  <leader>6 :6b<CR>
nnoremap  <leader>7 :7b<CR>
nnoremap  <leader>8 :8b<CR>
nnoremap  <leader>9 :9b<CR>
nnoremap  <leader>0 :10b<CR>


" powerline like bar (vim-airline)
Bundle 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" syntax
Bundle 'tpope/vim-markdown'

" git wrapper
Bundle 'tpope/vim-fugitive'
" git (and other VCS supported) gutter
" Bundle 'mhinz/vim-signify'

" VIM Latex Suite
Bundle 'jcf/vim-latex'

" VIM snippets (engine)
Bundle 'SirVer/ultisnips'
" actual snippets
Bundle 'honza/vim-snippets'
" can't use <TAB> because of YCM:
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" load custom snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnips"]

Bundle 'vim-scripts/DoxygenToolkit.vim'

" ---------------------
"  Color Schemes
" ---------------------

" sublime text default color theme: molokai:
Bundle 'tomasr/molokai'
" load color scheme as default:
" colorscheme molokai

" solarized theme
Bundle 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized

Bundle 'chriskempson/base16-vim'
"set background=dark

"========================================
"  No more editing from here
"========================================



filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.
