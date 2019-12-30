""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set number
set mouse=a
set laststatus=2
set numberwidth=2
set clipboard=unnamedplus

" MAPLEADER
let mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme badwolf
colorscheme molokai
" colorscheme spacegray

let g:spacegray_dark = 1

set t_Co=256
syntax on

" Always set background to BLACK
highlight Normal ctermbg=0 

" Highlight searches
set hlsearch

"Clear search highlighting
nnoremap <C-c> :nohlsearch<CR><C-L>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dictionary, Word Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set dictionary=~/dictionary/test.txt

augroup set_dictionary
    autocmd!
    autocmd filetype javascript set complete+=k~/.vim/dictionary/react.txt
    autocmd filetype scss set complete+=k~/.vim/dictionary/css.txt
    autocmd filetype scss set iskeyword+=\- " include - in search
    autocmd filetype css set complete+=k~/.vim/dictionary/css.txt
    autocmd filetype css set iskeyword+=\-
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" Indent by file type
augroup set_tabs
    autocmd!
    autocmd filetype cpp set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
    autocmd filetype html set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
    autocmd filetype css set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
    autocmd filetype scss set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
    " autocmd Filetype javascript setlocal ts=4 sw=4 sts=4 expandtab smarttab autoindent
    autocmd filetype json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
    autocmd filetype jsx set tabstop=4|set shiftwidth=4|set expandtab|set smarttab|set autoindent
    autocmd filetype php set tabstop=4|set shiftwidth=4|set expandtab|set smarttab|set autoindent
    autocmd filetype tpl set tabstop=4|set shiftwidth=4|set expandtab|set smarttab|set autoindent
    autocmd filetype javascript set tabstop=4|set shiftwidth=4|set expandtab|set smarttab|set autoindent
    autocmd filetype c set tabstop=4|set shiftwidth=4|set expandtab|set smarttab|set autoindent
    autocmd filetype ruby set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set autoindent
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NETREW 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  " autocmd VimEnter * :Vexplore
augroup END

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

nnoremap <leader>n :Vexplore<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi User1 ctermbg=216 ctermfg=black  guibg=red guifg=black
hi User2 ctermbg=239 ctermfg=black  guibg=red guifg=black
hi User3 ctermbg=29 ctermfg=black guibg=green guifg=black

function! GetTime()
    let l:newTime = strftime('%A %b %d %I:%M %p')
    return newTime
endfunction

set statusline=
set statusline+=%1*\  
set statusline+=\  
set statusline+=%2*\  
set statusline+=%2*\ %F 

" switch to right side
set statusline+=%=
set statusline+=%3*\ %{GetTime()}
set statusline+=\  
set laststatus=2

hi StatusLine                  ctermfg=18     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=12     ctermbg=2   cterm=NONE
set shortmess-=S

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cursor 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <special> jk <ESC>
" inoremap jk <esc>

" Traverse file paths
nnoremap <leader>t i<C-x><C-f>

" Save
nnoremap <leader>s :w<CR>

" Quit
nnoremap <leader>q :q<CR>

"Insert line above or below by pressing enter <Enter> in normal mode
nnoremap <Enter> :call append(line('.'), '')<CR>

" if exists('$TMUX')
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" endif

" Navigate windows
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR> 

" Clear highlighting
nnoremap <leader>c :nohlsearch<CR>

" Open init.vim
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source updated VIMRC without restarting
nnoremap <leader>sv :source $MYVIMRC<cr>

" Go to last position file
nnoremap <leader>. <C-O>

" Go to next posit,,n file
nnoremap <leader>, <C-I>

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <leader>sp :call ToggleSpellCheck()<CR>

nnoremap <leader>l :IndentLinesToggle<CR>

nnoremap <leader>H :call css_color#toggle()<CR>

nnoremap <leader>; A;<ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerd tree file highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

