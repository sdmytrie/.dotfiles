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
set undodir=~/.vim/undodir
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
set listchars=tab:→\ ,eol:↲,space:.
set encoding=UTF-8
set splitbelow splitright
set visualbell
set belloff=all

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set showtabline=2

" COC
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
" Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'francoiscabrol/ranger.vim'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
"Plug 'bling/vim-bufferline'
"Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'pangloss/vim-javascript'


call plug#end()

colorscheme gruvbox
"colorscheme elflord
set background=dark
set makeprg=flake8

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:loaded_matchparen=1

let g:ctrlp_use_caching=0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

let g:ycm_echo_current_diagnostic = 1

let g:bufferline_echo = 0

let g:javascript_plugin_jsdoc = 1

let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" let g:user_emmet_mode='n'

"let g:ranger_replace_netrw = 1
"let g:ranger_map_keys = 0
map <C-f> :Ranger<CR>
nmap <F3> :set hls! <CR>

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
nnoremap <leader>a :let &winwidth = &columns * 8 / 10<CR>
nnoremap <leader>z :let &winwidth = &columns * 5 / 10<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
"nnoremap <leader>gb :ls<CR>:b
"nnoremap <F2> :ls<CR>:b
nnoremap <F2> :Buffers<CR>
nnoremap <F4> :set list!<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"inoremap <C-j> <esc>:m .+1<CR>==
"inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <leader>/ :Commentary<CR>

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
