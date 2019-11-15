set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sonph/onehalf', {'rtp': 'vim/'}
NeoBundle 'takac/vim-hardtime'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'rhysd/vim-syntax-christmas-tree'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" settings
syntax on
hi LineNr term=standout term=reverse ctermfg=242 guibg=DarkGrey 

set autoindent
set backspace=2
set expandtab
set history=700
set hlsearch
set noswapfile
set number relativenumber
set shiftwidth=4
set tabstop=4
set undolevels=700
" set mouse=a

" settings for vim-powerline
set laststatus=2

" keymap
let mapleader = ','
inoremap jh <Esc>
inoremap nu <Esc>u
nnoremap <leader>ht :HardTimeToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap j jzz
nnoremap k kzz
nnoremap nO O<Esc>
nnoremap no o<Esc>
nnoremap na a <Esc>
nnoremap nA A <Esc>
nnoremap q! :q!<CR>
nnoremap w! :w!<CR>
nnoremap wh :vertical resize +5<CR>
nnoremap wj :res +5<CR>
nnoremap wk :res -5<CR>
nnoremap wl :vertical resize -5<CR>
nnoremap wq :wq<CR>
nnoremap wq! :wq!<CR>
noremap <S-d> :%s/
noremap <S-h>   ^
noremap <S-l>   $
noremap <leader>f :Files<CR>
noremap <leader>t :tab new<CR>
noremap fj 5j
noremap fk 5k
noremap nt :NERDTreeToggle<CR>
vnoremap <leader>s :sort<CR>
vnoremap jh <Esc>

" jedi-vim 
let g:jedi#completions_command = "<C-j>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = "<C-d>"
let g:jedi#documentation_command = "<C-k>"
" let g:jedi#auto_initialization = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" let g:jedi#rename_command = "[jedi]r"

" let g:jedi#usages_command = "[jedi]n"

autocmd FileType python setlocal completeopt-=preview

" ctrlp
let g:ctrlp_show_hidden = 1

" fzf
set rtp+=/usr/local/opt/fzf

" nerdtree
let NERDTreeShowHidden=1

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
