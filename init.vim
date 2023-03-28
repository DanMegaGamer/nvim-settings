call plug#begin('~/.config/nvim/plugged')
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'austintaylor/vim-indentobject'
 Plug 'dense-analysis/ale'
 Plug 'flazz/vim-colorschemes'
 Plug 'preservim/nerdtree' 
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rails'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-surround'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-ruby/vim-ruby'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-endwise'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'AndrewRadev/splitjoin.vim'
 Plug 'gennaro-tedesco/nvim-peekup'
call plug#end()

let mapleader = ','

" enable git gutter
let g:gitgutter_enabled = 1

" Use 2 spaces for indentation
set expandtab
set shiftwidth=2
set softtabstop=2

set rtp+=/usr/local/opt/fzf

set mouse=a

let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_ruby_standardrb_options = '--no-fix'
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 0

" Customise peekup
lua require('nvim-peekup.config').geometry["title"] = "Dead or alive you're coming with me"

" Start coc configuration
" Define list of extensions for Coc
let g:coc_global_extensions = ['coc-solargraph']

" use <tab> for trigger completion and s-tab to navigate back up.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter to confirm autocomplete selection
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" End coc configuration


set clipboard=unnamed                                        " yank and paste with the system clipboard
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`

" Toggle nerdtree with ,d
nnoremap <leader>d :NERDTreeToggle<CR>
" Find only Git files
noremap <leader>t :GFiles<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Rg<CR>

" set colorscheme
colorscheme gruvbox

" Clear search pattern (and therefore highlighting)
" nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[

" Quicker to use jj to exit insert mode
:imap jj <Esc>
