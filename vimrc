" ====================================
" #PLUGINS
" ====================================
call plug#begin('~/.vim/plugged')

" Load Plugins

" GUI enhancements
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'posva/vim-vue'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes

call plug#end()

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" ====================================
" Linter
" ====================================

let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

let mapleader = ' '
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr>CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick save
nmap <leader>w :w<CR>

" language server protocol
let g:LanguageClient_settingsPath = '/home/tajirhas9/.vim/settings.json'
let g:LanguageCient_autoStart = 1

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTreeCWD | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set scrolloff=2

" Permanent undo
set undodir=~/.vimd/undodir
set undofile
set number
syntax on
set showmatch
set ruler
set smarttab
set shiftwidth=4
set tabstop=4

" Window splitting
noremap <C-w>h :split<CR>
noremap <C-w>v :vsplit<CR>

" Switch between windows 
noremap <leader><leader> <C-w><C-w>
" Make window fullscreen
noremap <leader>ff :vertical resize 1000<CR>

" Resize windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" Vetur Setup
let g:LanguageClient_serverCommands = { 'vue': ['vls'] }

