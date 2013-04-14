" equk.co.uk - vimrc file
" =======================

set encoding=utf-8
autocmd! bufwritepost .vimrc source %
call pathogen#infect()

filetype off
filetype plugin indent on
syntax on
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


" General options
" ===============
let mapleader = "," " rebind <Leader> key
set wildmode=list:longest " allow TAB completion
set autoread " autoreload file on changes
set tags=~/.vim/tags/tags

set mouse=a
set bs=2 " backspace
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Display of cursor etc
set cursorline
set ruler
set autoindent
set smartindent 

" make yank copy to the global system clipboard
set clipboard=unnamed


" Improving code completion
set completeopt=longest,menuone


" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>


" Quick quit command
noremap <Leader>q :quit<CR>


" Bind nohl
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


set history=700
set undolevels=700


set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" toggle paste formatting
set pastetoggle=<F2>

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap " don't automatically wrap on load
set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing
set number " show line numbes

" center the cursor vertically
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Settings for jedi-vim
" =====================
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Settings for vim-powerline
" ===========================
set laststatus=2
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_symbols = 'unicode'

call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Settings for nerdtree
" =====================
map <leader>f :NERDTreeToggle<CR>

" Settings for vim-markdown
" ==========================
set nofoldenable


" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30


"
" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
vnoremap <Leader>s :sort<CR>


" Custom mappings
" ================
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all


" Clipboard mappings
" ==================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a

" highlight whitespace
" ====================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//


" Color scheme
" =============
set t_Co=256
color skittles_berry

set colorcolumn=80
" highlight ColorColumn ctermbg=233
map <Leader>v :source ~/.vimrc

