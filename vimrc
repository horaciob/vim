set nocompatible
filetype off

"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
set rtp+=~/.fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
Bundle 'nanotech/jellybeans.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'fatih/vim-go'

runtime macros/matchit.vim
filetype plugin indent on

color jellybeans

"set cursorline
set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set noerrorbells visualbell
"
" No show command
autocmd VimEnter * set nosc

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
map <C-n> :NERDTreeToggle<CR>

" Syntastic

filetype plugin on
syntax on

augroup rubypath
    autocmd!
    autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set nu

"let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Removes trailing spaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

" remove whitespace on save
autocmd BufWritePre <buffer> :call TrimWhitespace()

nnoremap <F5> :GundoToggle<CR>

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"nnoremap <C-t>. :CtrlPTag<cr>
nnoremap <leader>. :CtrlPTag<cr>

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" From ttps://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport autocomplete
" end
if !exists( "*RubyEndToken" )

  function RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction

endif

imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

" https://github.com/vim-ruby/vim-ruby/blob/master/doc/vim-ruby.txt
let g:ruby_indent_access_modifier_style = 'indent'

" fzf
let g:fzf_layout = { 'down': '~40%' }
nnoremap <C-p> :GFiles<Cr>

" Ag
nnoremap <C-g> :Ag<Cr>

" ALE!!!
let g:ale_linters_explicit = 1
" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'c': ['clang'],
\    'go': ['gofmt','golint', 'go vet'],
\   'ruby': ['rubocop'],
\}
" Only run linters named in ale_linters settings.
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0

" golang
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
set backspace=indent,eol,start
set colorcolumn=80

" system clipboard
set clipboard=unnamed
