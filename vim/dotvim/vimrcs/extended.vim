"""
" EXTENDED
""

" -- FUNCTIONS --
" toogle list and nolist character
function! ListToggle()
  if &list
    set nolist
    echo 'nolist'
  else
    set list
    echo 'list'
  endif
endfunction
nnoremap <silent> <leader>l :call ListToggle()<CR>

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
let g:highlightWhitespace = 2
function! g:ToggleHighlightWhitespace()
  if g:highlightWhitespace == 2
    let g:highlightWhitespace = 0
    match ExtraWhitespace //
  elseif g:highlightWhitespace == 0
    let g:highlightWhitespace = 1
    match ExtraWhitespace /\S\zs\s\+$/
  elseif g:highlightWhitespace == 1
    let g:highlightWhitespace = 2
    match ExtraWhitespace /\s\+$/
  endif
endfunction
call g:ToggleHighlightWhitespace()
nnoremap <silent> <leader>hw :call g:ToggleHighlightWhitespace()<CR>

" Function to toggle color column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
    match OverLength //
  else
    setlocal colorcolumn=80
    match OverLength /\%121v.*/
  endif
endfunction
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>

if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>l :call RunLastTest()<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

let t:minitest = 0

function! RunTestFile(...)
  if a:0
    let t:command_suffix = a:1
  else
    let t:command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end

  let last_text_command = t:grb_test_file . t:command_suffix
  call RunTests(last_text_command)
endfunction

function! RunLastTest()
  call RunTests(t:grb_test_file . t:command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  if t:minitest
    call RunTestFile(" -l" . spec_line_number)
  else
    call RunTestFile(":" . spec_line_number . " -b")
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif t:minitest
      exec ":!bundle exec ruby " . a:filename
    elseif filereadable("Gemfile") && filereadable("bin/rspec")
      echo "e"
      "exec ":!bundle exec rspec --color " . a:filename
      exec ":!bin/rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CommandT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT .<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT<cr>
nnoremap <silent> <leader>b :CommandTMRU<CR>
set wildignore+=node_modules,Godeps/_workspace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""
" COPY QuickFix list to buffer
"""""""""""""""""""""""""""""""""
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

""""""""""""""""""""""""""""""""
" Copy ARG list
""""""""""""""""""""""""""""""""
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified
      \|    if empty(bufname('%'))
        \|        browse confirm write
        \|    else
          \|        confirm write
          \|    endif
          \|endif
noremap <silent> <C-S> :<C-u>Update<CR>
inoremap <silent> <C-S> <esc>:<C-u>Update<CR>
