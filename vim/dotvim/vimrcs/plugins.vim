" -- PLUGINS --
" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" --- EDITOR ---
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'kana/vim-textobj-user'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/YankRing.vim'


" --- UTILITY ---
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jgdavey/tslime.vim'
Plugin 'SirVer/ultisnips'
Plugin 'yulrizka/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
"Plugin 'majutsushi/tagbar'

"cd ~/.vim/bundle/Command-T/ruby/command-t/;/usr/bin/ruby extconf.rb;make
Plugin 'wincent/Command-T'

" --- PROGRAMMING ---
" Ruby
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Golang
" :GoInstallBinaries
Plugin 'fatih/vim-go'

" YouCompleteMe
" sudo apt-get install build-essential cmake python-dev;cd ~/.vim/bundle/YouCompleteMe;./install.sh
Plugin 'Valloric/YouCompleteMe'

" --- WEB ---
Plugin 'lukaszb/vim-web-indent'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'

call vundle#end()
filetype plugin indent on

""
" -- PLUGIN CONFIG --
""

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Fugitive
autocmd User Fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

" ctags
let g:tagbar_foldlevel = 0
let g:tagbar_autoshowtag = 2
map <F4> :Tagbar<cr>

" vim go
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'gotype']

"" Command-T ignore bower_components
let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,*.,*.class"
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT .<cr>
map <leader>F :CommandT<cr>
nnoremap <silent> <leader>b :CommandTMRU<CR>
set wildignore+=node_modules,Godeps/_workspace

vnoremap <silent> <leader>rr "ry :call Send_to_Tmux(@r)<CR>
noremap <silent> <leader>rr "ry :call Send_to_Tmux(@r)<CR>
noremap <leader>rs <Plug>SetTmuxVars

let g:syntastic_go_checkers = ['golint', 'govet', 'gotype']
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": [],
      \ "passive_filetypes": ["go"] }

let g:go_fmt_autosave = 0
"let g:go_metalinter_autosave = 1

" enable git gutter
let g:gitgutter_enabled = 1
nnoremap <CR> :nohlsearch<cr>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree
let g:NERDTreeWinPos = "right"

" Multi Cursors
let g:multi_cursor_start_key='<leader>m'

" YankRing 
" disable on start
autocmd VimEnter * silent YRToggle(0)
nnoremap <leader>y :YRToggle<CR>
