syntax on
set nu
syn on
set mouse=a
set smartindent
set autoindent
set ttymouse=xterm2
set encoding=utf-8
colorscheme wombat256mod
set t_Co=256
set listchars=tab:·\ ,eol:¬
set laststatus=2
set showmatch
set incsearch
set hlsearch
set list
let mapleader=','
set history=10000
set ignorecase smartcase
set cursorline
set cmdheight=2
set winwidth=79
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" store temporary file in central directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

" virtual tabstops using spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" scroll
set scrolloff=3

" -- EDITOR CONFIG --
" restor cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"window commands
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <s-tab> <c-n>

" Function to toogle vertical line
nnoremap <silent> <leader>vl :set cursorcolumn!<CR>

set pastetoggle=<F3>
map <F5> <Esc>:EnableFastPHPFolds<CR>:let g:DisableAutoPHPFolding = 0<CR>
map <F6> <Esc>:EnablePHPFolds<CR>:let g:DisableAutoPHPFolding = 0<CR>
map <F7> <Esc>:DisablePHPFolds<CR>:let g:DisableAutoPHPFolding = 1<CR>
nmap <F9> :set expandtab!<CR>
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

" folding
nnoremap <Space> za
vnoremap <Space> za

" Buffer, used ?
nnoremap <silent> <C-n>      :FufBuffer<CR>
nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
nnoremap <silent> <C-f>p     :FufFile<CR>

"tab commands
map <Leader>] gt
map <Leader>[ gT
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt
map <Leader>0 :tablast<CR>

" Undo
set undodir=~/.vim/undodir
set undofile
set undolevels=10000
set undoreload=10000

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"save
map <leader>s :w<CR>
imap <leader>s <esc>:w<CR>
map <C-s> :w<CR>
imap <C-s>s <esc>:w<CR>

map <leader>q :q<CR>

" disable entring ex mode
:nnoremap Q <Nop>

"Commands
command! W w !sudo tee % > /dev/null
command! -range=% CheckWhitespace <line1>,<line2>s/\s\+$//gc
command! Q q

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>D "_D
vnoremap <leader>D "_D

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

nnoremap <leader>= :Align<CR>
vnoremap <leader>= :Align<CR>

" Copy paste from clipboard (xclip) must be enabled
vmap "+y :!xclip -f -sel clip<CR>
map "+p :!xclip -o -sel clip<CR>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <CR> :nohlsearch<cr>
endfunction
call MapCR()

nnoremap <leader><leader> <c-^>

" search for selected text
vnoremap // y/<C-R>"<CR>
