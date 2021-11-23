call plug#begin('~/.vim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'godlygeek/tabular'
Plug 'gruvbox-community/gruvbox'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhinz/vim-signify'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'
Plug 'sainnhe/sonokai'
Plug 'shaunsingh/moonlight.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'windwp/nvim-ts-autotag'
Plug 'yggdroot/indentline'
Plug 'yuezk/vim-js'
" Plug 'dense-analysis/ale'
Plug 'elmcast/elm-vim'
" Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'
Plug 'purescript-contrib/purescript-vim'

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

" let g:UltiSnipsJumpForwardTrigger="<c-a>"
" let g:UltiSnipsJumpBackwardTrigger="<c-x>"

let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

let g:indentLine_char = '▏'
let g:vim_jsx_pretty_colorful_config = 1

" One of the most important commands here!
set lazyredraw
set nu
set nohlsearch
set hidden
set smarttab
set incsearch
set scrolloff=8
" set colorcolumn=90
set updatetime=250

if (has("termguicolors"))
  set termguicolors
endif

" let g:tokyonight_style = 'storm' " available: night, storm

" let g:sonokai_style = 'maia'

colorscheme palenight

" set background=dark
" let g:tokyonight_enable_italic = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"

hi Normal guibg=NONE ctermbg=NONE

let test#python#runner = 'pytest'
let test#strategy = 'dispatch'

" Buffer bindings
map <F2> :GFiles<CR>
map <F4> :bdelete<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>

" Cool bindings
nnoremap <C-J> :cprev<CR>
nnoremap <C-K> :cnext<CR>
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
nnoremap <leader>a= :Tab /=<CR>
vnoremap <leader>a= :Tab /=<CR>
nnoremap <leader>a: :Tab /:\zs<CR>
vnoremap <leader>a: :Tab /:\zs<CR>
nnoremap <leader>rg :Rg<CR>
vnoremap <leader>rg y:Rg <C-r>"<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>w vey:Rg <C-r>"<CR>

nnoremap <silent><C-c> :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>h :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>j :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>k :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>l :lua require("harpoon.ui").nav_file(4)<CR>

nmap ss :vsplit<Return><C-w>w<C-w>=
nmap sv :split<Return><C-w>w<C-w>=
nmap sg ssgd<C-w>=
nmap sb svgd<C-w>=
nmap s= <C-w>=

nmap sh <C-w>h
nmap sj <C-w>j
nmap sk <C-w>k
nmap sl <C-w>l

nnoremap + <C-a>
nnoremap - <C-x>

nmap <C-a> gg<S-v>G

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
set grepformat=%f:%l:%c:%m

" Gets rid of trailing whitespace automatically
augroup CARLO
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup vimrc
	autocmd!
	autocmd BufRead *.tsx setlocal shiftwidth=2 tabstop=2 list expandtab
	autocmd BufRead *.ts  setlocal shiftwidth=2 tabstop=2 list expandtab
	autocmd BufRead *.elm setlocal shiftwidth=4 tabstop=4 list expandtab
	autocmd BufRead *.purs setlocal shiftwidth=2 tabstop=2 list expandtab
	autocmd BufRead *.json setlocal shiftwidth=2 tabstop=2 list expandtab
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
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

set shortmess+=c

" Completion engines
lua << EOF
	require'lualine'.setup {
		options = {
			theme = "onedark",
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {{'diagnostics', sources={'nvim_lsp'}}},
			lualine_c = {'filename'},

			lualine_x = {'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
	}

	require'compe-config'
	require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.hls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.elmls.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.purescriptls.setup {
		on_attach=require'completion'.on_attach,
		settings = {
			purescript = {
				addSpagoSources = true
			}
		},
		flags = {
			debounce_text_changes = 150,
		}
	}

	require'nvim-treesitter.configs'.setup {
		autotag = {
			enable = true,
		}
	}

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
