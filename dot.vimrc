set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Reverseblade/vim-line-control'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rhysd/vim-syntax-christmas-tree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sonph/onehalf', {'rtp': 'vim/'}
NeoBundle 'takac/vim-hardtime'
NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'blueyed/vim-diminactive'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" settings
syntax on
hi LineNr term=standout term=reverse ctermfg=242 guibg=DarkGrey 

" set mouse=a
set autoindent
set backspace=2
set expandtab
set history=700
set hlsearch
set laststatus=2
set noswapfile
set number relativenumber
set shiftwidth=4
set splitbelow
set t_Co=256
set tabstop=4
set undolevels=700

" keymap
let mapleader = ','
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap < <><LEFT>
inoremap jh <Esc>
inoremap nu <Esc>u
inoremap { {}<LEFT>
nnoremap <leader>b <C-b>
nnoremap <leader>ht :HardTimeToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap nA A <Esc>
nnoremap nO O<Esc>
nnoremap na a <Esc>
nnoremap no o<Esc>
nnoremap q! :q!<CR>
nnoremap sh :split<CR>
nnoremap sv :vsplit<CR>
nnoremap w! :w!<CR>
nnoremap wh <C-w>h
nnoremap wj <C-w>h
nnoremap wk <C-w>k
nnoremap wl <C-w>l
nnoremap wq :wq<CR>
nnoremap wq! :wq!<CR>
noremap <S-h>   ^
noremap <S-l>   $
noremap <S-s> :s/
noremap <leader>f :Files<CR>
noremap <leader>fc :Files ~/Code<CR>
noremap <leader>fd :Files ~/dotfiles<CR>
noremap <leader>t :tab new<CR>
noremap fj 5j
noremap fk 5k
noremap nt :NERDTreeToggle<CR>
vnoremap <leader>s :sort<CR>
vnoremap jh <Esc>

" jedi-vim 
let g:jedi#completions_command = "<C-j>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = "<leader>d"
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

" vim-submode
call submode#enter_with('win-resize', 'n', '', 'w>', '<C-w>>')
call submode#enter_with('win-resize', 'n', '', 'w<', '<C-w><')
call submode#enter_with('win-resize', 'n', '', 'w+', '<C-w>+')
call submode#enter_with('win-resize', 'n', '', 'w-', '<C-w>-')
call submode#map('win-resize', 'n', '', '>', '<C-w>>')
call submode#map('win-resize', 'n', '', '<', '<C-w><')
call submode#map('win-resize', 'n', '', '+', '<C-w>+')
call submode#map('win-resize', 'n', '', '-', '<C-w>-')

call submode#enter_with('tmp-normal', 'i', '', '<C-o>h', '<C-o>h')
call submode#enter_with('tmp-normal', 'i', '', '<C-o>l', '<C-o>l')
call submode#map('tmp-normal', 'i', '', 'h', '<C-o>h')
call submode#map('tmp-normal', 'i', '', 'l', '<C-o>l')

call submode#enter_with('line-move', 'n', '', '<C-l>j', ':call MoveLineDown()<CR>')
call submode#enter_with('line-move', 'n', '', '<C-l>k', ':call MoveLineUp()<CR>')
call submode#map('line-move', 'n', '', 'j', ':call MoveLineDown()<CR>')
call submode#map('line-move', 'n', '', 'k', ':call MoveLineUp()<CR>')

" local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
