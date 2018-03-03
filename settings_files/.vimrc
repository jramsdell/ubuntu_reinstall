set nowrap
" set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set incsearch
syntax on
let g:notes_tab_indents=1
let g:notes_alt_indents=0
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1, 'txt':1,'plaintext':1,'text':1, 'notes':1 }
let g:ycm_filetype_blacklist={}

set iskeyword-=_


" ultisnips settings
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-tab>"

" Y now yanks everything from the cursor to the right
noremap Y y$ 


execute pathogen#infect()
set completeopt-=preview
"inoremap <S-Tab> <C-D>
let g:notes_directories = ['~/Dropbox/Notes','~/Documents/Notes']
set number
set smartcase
set ignorecase
cnoremap ssn SearchNotes /
cnoremap ssr RecentNotes 
cnoremap sst ShowTaggedNotes 
let mapleader = "\<Space>"
let g:EasyMotion_smartcase = 1
noremap I J
nnoremap K i<CR><Esc>
map <Space> <Plug>(easymotion-prefix)
map s <Plug>(easymotion-s2)
map J <Plug>(easymotion-bd-jk)
map L <Plug>(easymotion-eol-bd-jk)
"map Y <Plug>(easyoperator-phrase-yank)
map <Leader>yp <Plug>(easyoperator-phrase-yank)
map <Leader>yl <Plug>(easyoperator-line-yank)
map <Leader>dp <Plug>(easyoperator-phrase-delete)
map <Leader>dl <Plug>(easyoperator-line-delete)
map <Leader>vp <Plug>(easyoperator-phrase-select)
map <Leader>vl <Plug>(easyoperator-line-select)
map  <Plug>NERDCommenterInvert

map <Leader>j zz
map <Leader>i zt
map <Leader>k zb


filetype plugin on
syntax on
filetype plugin indent on
noremap - $
"noremap <A-l> <C-w><Right>
"noremap <A-j> <C-w><Left>
"noremap <A-k> <C-w><Down>
"noremap <A-i> <C-w><Up>
" noremap \ .
"noremap . ;
noremap ; :
noremap h i
noremap H I
nnoremap i <Up>
" noremap j <Left>
noremap j b
noremap l e
noremap k <Down>
noremap <c-j> 10<Left>
noremap <c-i> {zz
noremap <c-k> }zz
noremap <c-l> 10<Right>
noremap q "
noremap ' q
nno qq :register<Return>
nno mm :marks<Return>
noremap " @
ino jj <esc>
cno jj <c-c>
vno v <esc>



" Insert Mode Stuff
inoremap <C-l> <Right>
inoremap <C-j> <Left>

" Alt Mapping


noremap l <C-w><Right>                                                        
noremap  j <C-w><Left>                                                         
noremap k <C-w><Down>                                                         
noremap i <C-w><Up> 
noremap <M-l> <C-w><Right>                                                        
noremap  <M-j> <C-w><Left>                                                         
noremap <M-k> <C-w><Down>                                                         
noremap <M-i> <C-w><Up> 

noremap OC <C-w><Right>
noremap OD   <C-w><Left>
noremap [1;5B <C-w><Down>
noremap [1;5A <C-w><Up>


set expandtab
set tabstop=4
set shiftwidth=4


"nnoremap <CR> :w \| let x=system('pdflatex expand("%:r").tex; evince myfile.pdf &')<CR>



command! -nargs=? -range Hex call s:Hex(<line1>, <line2>, '<args>')
function! s:Hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction 

"Custom functions for DND
function! Temp(template)
    let type=a:template
    execute ':read ' . '~/Documents/Templates/' . type
endfunction
command! -nargs=? -range Temp call Temp('<args>')

function! Table(template)
    let type=a:template
    let type2="Hello"
    "if (type == "personality")
    "        :read !shuf -n 1 ~/Documents/Tables/personality_traits
    execute ':read !shuf -n 1 ' . '~/Documents/Tables/' . type
endfunction
command! -nargs=? -range Table call Table('<args>')


colorscheme Chasing_Logic


" auto-enter paste mode when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


" Vimshell stuff
"let g:vimshell_no_default_keymappings=1
"nnoremap <CR> <Plug>(vimshell_enter)
"inoremap <CR> <Plug>(vimshell_enter)

augroup MyAutoCmd
          autocmd!
  augroup END

"autocmd MyAutoCmd FileType vimshell call s:vimshell_settings()
"function! s:vimshell_settings()
        "nnoremap <buffer> i <Up>
"endfunction
