call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'justinmk/vim-sneak'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'francoiscabrol/ranger.vim'

Plug 'scalameta/nvim-metals'

Plug 'jiangmiao/auto-pairs'

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'


call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

set nu rnu

set background=dark
colorscheme palenight

if (has("termguicolors"))
  set termguicolors
endif

map <F2> :FZF<CR>

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
	require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
EOF
