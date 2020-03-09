" Base Vim Settings
set mouse=a
set clipboard+=unnamedplus
set updatetime=500
set number
set relativenumber
set nowrap
set scrolloff=3
set tabstop=4
set shiftwidth=4
set lazyredraw
set ignorecase
set smartcase
nnoremap <silent><C-n> :set hlsearch!<CR>
inoremap <silent><C-p> <Esc>pa
tnoremap <Esc> <C-\><C-n>

" Restore Last Cursor Position
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		normal! zz
		return 1
	endif
endfunction
autocmd BufWinEnter * call ResCur()

" Toggle Soft Tabs
nnoremap <M-s> :call ExpandTab()<CR>
function! ExpandTab()
	set expandtab!
	if &expandtab == 1
		echo "Soft Tabs Enabled"
	else
		echo "Soft Tabs Disabled"
	endif
endfunction

" Window Tab Controls
nnoremap <silent><M-t> :tabnew<CR>
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt

" Folding
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=1

" Auto Indent
nnoremap == :call AutoIndentDocument()<CR>
function! AutoIndentDocument()
	let l:view = winsaveview()
	normal! gg=G
	call winrestview(view)
endfunction

" Better Manual Indent
vmap < <gvh
vmap > >gvl
vmap <M-l> >
vmap <M-h> <
nmap <M-l> >>
nmap <M-h> <<

" Alt moving
nmap <silent><M-k> :<C-U>execute "m . " expand(v:count1 * -1 - 1)<CR>:normal! ==<CR>
nmap <silent><M-j> :<C-U>execute "m . " expand(v:count1)<CR>:normal! ==<CR>
vmap <silent><M-k> :<C-U>execute "'<,'>m '< " . expand(v:count1 * -1 - 1)<CR>gv=gv
vmap <silent><M-j> :<C-U>execute "'<,'>m '> +" . expand(v:count1)<CR>gv=gv

" Disable Built-In Vim / Neovim Plugins
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_2html_plugin = 1
let g:loaded_sql_completion = 1
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0

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
		normal! K
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = "%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
