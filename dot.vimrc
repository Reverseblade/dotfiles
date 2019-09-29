set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'takac/vim-hardtime'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" settings
syntax on

set autoindent
set backspace=2
set expandtab
set hlsearch
" set mouse=a
set noswapfile
set nu rnu
set number relativenumber
set shiftwidth=4
set tabstop=4
" settings for vim-powerline
set laststatus=2

" keymap
let mapleader = ','
noremap write :w<CR>
noremap wr :w<CR>
noremap wq :wq<CR>
noremap w! :w!<CR>
noremap qq :q<CR>
noremap q! :q!<CR>
noremap <S-d> :%s//
noremap <leader>t :tab new<CR>
noremap nt :NERDTreeToggle<CR>
nnoremap j jzz
nnoremap k kzz
inoremap jh <esc>
vnoremap jh <esc>
vnoremap <leader>s :sort<CR>

" make vim look like a badass python ide
" let g:jedi#completions_command = "<C-j>"
" let g:jedi#goto_assignments_command = "<C-g>"
" let g:jedi#goto_definitions_command = "<C-d>"
" let g:jedi#documentation_command = "<C-k>"
" let g:jedi#rename_command = "[jedi]r"
" let g:jedi#usages_command = "[jedi]n"
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0
" 
" ctrlp
let g:ctrlp_show_hidden = 1

" fzf
" set rtp+=/usr/local/opt/fzf
