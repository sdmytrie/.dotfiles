" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set nocompatible
"set t_Co=256
colorscheme desert
"colorscheme ron
set background=dark
syntax enable
"filetype plugin on
set path+=.,**
set wildignore+=**/node_modules/**
set wildignore+=**/venv/**
set wildignore+=**/__pycache__/**
set wildmenu
set hlsearch
set incsearch
set scrolloff=4
noremap <C-Insert> :tabnew<CR>
noremap <C-Delete> :tabclose<CR>

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

"set showbreak=↪\
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set listchars=tab:→\ ,eol:↲

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'preservim/nerdtree'
"Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'dense-analysis/ale'

call vundle#end()
filetype plugin indent on
"filetype plugin on

autocmd VimEnter * wincmd p

set ai
set nu relativenumber
set encoding=utf-8
set sm
set tabstop=2 shiftwidth=2 expandtab

set laststatus=2

set splitbelow splitright

"noremap <silent> <M-left> :vertical resize +5<CR>
"noremap <silent> <M-right> :vertical resize -5<CR>
"noremap <silent> <M-up> :vertical resize +5<CR>
"noremap <silent> <M-down> :vertical resize -5<CR>
noremap <C-A> :let &winwidth = &columns * 8 / 10<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"hi Pmenu ctermfg=250 ctermbg=235 gui=underline guifg=#bcbcbc guibg=#262626
"hi PmenuSel ctermfg=250 ctermbg=131 gui=underline guifg=#bcbcbc guibg=#af5f5f
"
"hi Folded ctermfg=7
"hi Folded ctermbg=black
"
"hi ToolbarLine ctermfg=7
"hi ToolbarLine ctermbg=black

" Disables automatic comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all trailing spaces on save
" autocmd BufWritePre * %s/\s\+$//e

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0

" run prettier on save
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

set cursorline
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
let g:loaded_matchparen=1

if !has('gui_running')
  set t_Co=256
endif
set noshowmode
