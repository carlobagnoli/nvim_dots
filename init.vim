call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

Plug 'justinmk/vim-sneak'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'francoiscabrol/ranger.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'voldikss/vim-floaterm'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

set nu

set background=dark
colorscheme palenight
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"


if (has("termguicolors"))
  set termguicolors
endif

map <F2> :FZF<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F4> :bdelete<CR>

nnoremap <leader>gt :FloatermNew lazygit<CR>
nnoremap <leader>t :FloatermToggle<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

set shortmess+=c

lua << EOF
	require'compe-config'
	require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach}
EOF
