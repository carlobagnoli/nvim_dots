call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-signify'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'yggdroot/indentline'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

let g:sneak#label = 1
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
let g:indentLine_char = '▏'

" One of the most important commands here!
set lazyredraw
set nu
set nohlsearch
set hidden
set incsearch
set scrolloff=5
set colorcolumn=90

set background=dark
colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"
hi Normal guibg=NONE ctermbg=NONE

let test#python#runner = 'pytest'
let test#strategy = 'dispatch'

if (has("termguicolors"))
  set termguicolors
endif

" Buffer bindings
map <F2> :FZF<CR>
map <F4> :bdelete<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>

" Cool bindings
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>Spi vip:sor!<CR>
nnoremap <leader>Spn vip:sor n<CR>
nnoremap <leader>Spp vip:sor<CR>
nnoremap <silent> Q <nop>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Gets rid of trailing whitespace automatically
augroup CARLO
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup vimrc
	autocmd!
	autocmd BufRead *.tsx setlocal shiftwidth=2 tabstop=2 list expandtab
augroup END

" Floaterm bindings
nnoremap <leader>gt :FloatermNew lazygit<CR>
nnoremap <leader>tt :FloatermToggle<CR>

" vim-test bindings
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tv :TestVisit<CR>

" Completion engine bindings
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

set shortmess+=c

" Completion engines
lua << EOF
	require'compe-config'
	require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach}

	require'colorizer'.setup(
	{'*';},
	{
		RGB      = true;         -- #RGB hex codes
		RRGGBB   = true;         -- #RRGGBB hex codes
		names    = true;         -- "Name" codes like Blue
		RRGGBBAA = true;         -- #RRGGBBAA hex codes
		rgb_fn   = true;         -- CSS rgb() and rgba() functions
		hsl_fn   = true;         -- CSS hsl() and hsla() functions
		css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
	})
EOF
