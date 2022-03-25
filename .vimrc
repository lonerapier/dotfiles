" Change mapleader
let mapleader = ","
set background=dark
" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif

set wmh=0

set smartcase
set noswapfile
set nobackup

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80
highlight ColorColumn guibg=#181818
" }}}
highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic

" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard+=unnamedplus
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set undofile

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable syntax highlighting
syntax on
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

set completeopt=noinsert,menu,menuone,noselect
set cursorline
set hidden
" Enable line numbers
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4 softtabstop=4
set shiftwidth=4
set smarttab

set nu
set nohlsearch
set nowrap
set formatoptions-=t
set noshowmode

" don't autoinsert two spaces after '.', '?', '!' for join command
set nojoinspaces

set wildignore+=*/node_modules/**

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" attempt to speed-up vim
set ttyfast
set lazyredraw

filetype plugin indent on
syntax on

set t_Co=256

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Tab navigation like Firefox.
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>

if has("nvim")
	call plug#begin('~/.config/nvim/autoload/plugged')

	" Dashboard
	Plug 'glepnir/dashboard-nvim'

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Dev Icons
	Plug 'ryanoasis/vim-devicons'

	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Utilities
	Plug 'ap/vim-css-color'

	" nerdtree
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Completion / linters / formatters
	Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
	Plug 'plasticboy/vim-markdown'

	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'

	" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'ekalinin/Dockerfile.vim'
	Plug 'tpope/vim-commentary'
	Plug 'evanleck/vim-svelte', { 'for': ['svelte'], 'branch': 'main' }
	Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
	Plug 'bronson/vim-visual-star-search'
	Plug 'tikhomirov/vim-glsl'
	Plug 'junegunn/goyo.vim'
	Plug 'exu/pgsql.vim'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'lervag/vimtex', { 'for': ['tex'] }
	Plug 'itchyny/vim-gitbranch'
	Plug 'cespare/vim-toml'
	Plug 'rust-lang/rust.vim'
	Plug 'neoclide/coc.nvim', { 'branch': 'release'}
	Plug 'tomlion/vim-solidity'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
	Plug 'jparise/vim-graphql'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-ruby/vim-ruby'

	Plug 'dracula/vim', { 'name': 'dracula' }
	" monokai
	Plug 'sickill/vim-monokai'
	" github
	Plug 'cormacrelf/vim-colors-github'
	" Plug 'npxbr/gruvbox.nvim'

	" copilot
	Plug 'github/copilot.vim'

	Plug 'easymotion/vim-easymotion'

	" Completion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'David-Kunz/cmp-npm'

	" Language Server Protocol
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'folke/trouble.nvim'
	Plug 'onsails/lspkind-nvim'
	Plug 'creativenull/diagnosticls-configs-nvim'

	call plug#end()
endif

lua <<EOF
require('gitsigns').setup {
  signs = {
    changedelete = { text = "│" }
  }
}
EOF