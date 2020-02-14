" Base Vim Settings
set mouse=a
set clipboard+=unnamedplus
set updatetime=500
set number
set scrolloff=3
set tabstop=4
set shiftwidth=4

" Folding
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=1

" Auto Indent
nnoremap == gg=G<C-o><C-o>

" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'vim-airline/vim-airline'
	Plug 'tomasiser/vim-code-dark'
call plug#end()

" Auto Completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" File Browser
let loaded_netrwPlugin = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" Theme
set termguicolors
colorscheme codedark
let g:airline_theme = 'codedark'
