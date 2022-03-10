syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
"set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set t_Co=256
set path+=.,**
set wildignore+=**/node_modules/**
set wildignore+=**/venv/**
set wildignore+=**/__pycache__/**
set wildmenu
set hlsearch
set scrolloff=4
set listchars=tab:→\ ,eol:↲
set encoding=UTF-8
set splitbelow splitright
set visualbell
set belloff=all

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set noshowmode

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
" set signcolumn=number

call plug#begin('~/.local/share/nvim/plugged')

Plug 'ellisonleao/gruvbox.nvim'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf.vim'
" Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'francoiscabrol/ranger.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'ray-x/lsp_signature.nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'preservim/tagbar'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

call plug#end()
lua require('serge')

let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let mapleader=" "

let g:python_host_prog = '/user/bin/python'
let g:python3_host_prog = '/user/bin/python'

set termguicolors
set background=dark
colorscheme gruvbox
set completeopt=menu,menuone,noselect

map <C-f> :Ranger<CR>
nmap <F3> :set hls! <CR>
nnoremap <leader>u :UndotreeShow<CR>
nmap <F8> :TagbarToggle<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

nnoremap <leader>/ :Commentary<CR>

autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>
