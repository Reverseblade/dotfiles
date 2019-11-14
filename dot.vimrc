set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sonph/onehalf', {'rtp': 'vim/'}
NeoBundle 'takac/vim-hardtime'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" settings
syntax on
hi LineNr term=standout term=reverse ctermfg=242 guibg=DarkGrey 

set autoindent
set backspace=2
set expandtab
set hlsearch
set noswapfile
set number relativenumber
set shiftwidth=4
set tabstop=4
" set mouse=a

" settings for vim-powerline
set laststatus=2

" keymap
let mapleader = ','
inoremap jh <Esc>
inoremap nu <Esc>u
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap j jzz
nnoremap k kzz
nnoremap nO O<Esc>
nnoremap no o<Esc>
nnoremap q! :q!<CR>
nnoremap w! :w!<CR>
nnoremap wq :wq<CR>
nnoremap wq! :wq!<CR>
noremap <S-d> :%s/
noremap <S-h>   ^
noremap <S-l>   $
noremap <leader>t :tab new<CR>
noremap nt :NERDTreeToggle<CR>
vnoremap <leader>s :sort<CR>
vnoremap jh <Esc>

" make vim act like a badass python ide
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
" let g:jedi#completions_command = "<C-j>"
" let g:jedi#goto_assignments_command = "<C-g>"
" let g:jedi#goto_definitions_command = "<C-d>"
" let g:jedi#documentation_command = "<C-k>"
" let g:jedi#rename_command = "[jedi]r"
" let g:jedi#usages_command = "[jedi]n"

" ctrlp
let g:ctrlp_show_hidden = 1

" fzf
set rtp+=/usr/local/opt/fzf

" nerdtree
let NERDTreeShowHidden=1
