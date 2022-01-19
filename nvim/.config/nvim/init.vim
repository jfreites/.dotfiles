
"           88    ad88
"           ""   d8"
"                88
"           88 MM88MMM
"           88   88
"           88   88
"           88   88
"           88   88
"          ,88
"        888P"
"
"   Personal vim configuration of Jonathan Freites <jonathanfreites@gmail.com>


" ------------------------------------------------------
" General
" ------------------------------------------------------

set expandtab
set title
set nowrap
set scrolloff=999
set hidden
set termguicolors
set ignorecase
set smartcase
set list
set listchars=tab:▸\ ,trail:·
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set splitbelow
set splitright
set mouse=a
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set encoding=UTF-8

" --
" Key maps
" --

let mapleader = "\<space>"

inoremap <C-c> <esc>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Quicky scape in normal mode
imap jj <esc>

" --
" Plugins setup
" --

call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/whichkey.vim

"Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
"Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
"Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors


call plug#end()

doautocmd User PlugLoaded

"let g:lightline = {}
"let g:lightline.colorscheme = 'gruvbox'

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

" Disable python2 from checkhealth
let g:loaded_python_provider = 0
let g:python_host_prog = ''

" Ruby current version
let g:ruby_host_prog = '~/rvm/rubies/ruby-3.0.3/bin/ruby'

augroup FileTypeOverrides
    autocmd!
    " Use '//' instead of '/* */' comments
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END


"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
