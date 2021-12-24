Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-phpls',
    \ 'coc-php-cs-fixer',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-sql',
    \ 'coc-svg',
    \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
    \ 'coc-tsserver',
    \ '@yaegassy/coc-volar',
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
