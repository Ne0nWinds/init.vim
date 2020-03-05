" Base Vim Settings
set mouse=a
set clipboard+=unnamedplus
set updatetime=500
set number
set nowrap
set scrolloff=3
set tabstop=4
set shiftwidth=4
set lazyredraw
nnoremap <silent><C-n> :set hlsearch!<CR>
nnoremap <silent><C-t> :set expandtab!<CR>

" Folding
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=1

" Auto Indent
nnoremap == :call AutoIndentDocument()<cr>
function! AutoIndentDocument()
	let l:view = winsaveview()
	execute "normal! gg=G<C-o>"
	call winrestview(view)
endfunction

" Better Manual Indent
vnoremap < <V'>
vnoremap > >V'>

" Alt moving
nnoremap <M-k> :m . -2<CR>
nnoremap <M-j> :m . +1<CR>
vnoremap <M-k> :m '< -2<CR>gv=gv
vnoremap <M-j> :m '> +1<CR>gv=gv

" Disable Built-In Vim Plugins
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_2html_plugin = 1
let g:loaded_sql_completion = 1

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

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim' || &filetype == 'sh'
		execute 'normal! K'
	else
		call CocAction('doHover')
	endif
endfunction

" File Browser
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
nnoremap <silent><Space> :NERDTreeToggle<cr>

" Theme
set termguicolors
colorscheme codedark
let g:airline_theme = 'codedark'

" Airline Extension
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#coc#enabled = 1
