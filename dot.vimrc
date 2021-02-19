if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-submode'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'takac/vim-hardtime'
Plug 'ujihisa/unite-colorscheme'
Plug 'mattn/emmet-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-rails'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'thinca/vim-quickrun'

" Initialize plugin system
call plug#end()

filetype plugin indent on

" Basic Settings 
syntax on
hi LineNr term=standout term=reverse ctermfg=242 guibg=DarkGrey 

set autoindent
set backspace=2
set clipboard=unnamed,autoselect
set expandtab
set history=700
set hlsearch
set laststatus=2
set mouse=a
set noswapfile
set number relativenumber
set shiftwidth=4
set splitbelow
set t_Co=256
set tabstop=4
set undolevels=700
set wildmenu
set wildmode=full

" Key Mappings 
let mapleader = ','
"nnoremap <leader>d :LspDefinition<CR>
"nnoremap <leader>ht :HardTimeToggle<CR>
"nnoremap <leader>r :LspReference<CR>
inoremap jh <Esc>
nnoremap <leader>nt :tab new<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>ttv :ToggleTV<CR>
nnoremap <silent><leader>f :Files<CR>
nnoremap sh :split<CR>
nnoremap sv :vsplit<CR>
noremap <S-h>   ^
noremap <S-l>   $
noremap <S-s> :%s/
noremap <leader>f :Files<CR>
noremap <leader>r :QuickRun<CR>
noremap <silent> nt :NERDTreeToggle<CR>
vnoremap jh <Esc>

" makes Ascii art font
nmap <silent><leader>F :.!toilet -w 200<CR>

" makes Ascii border
nmap <silent><leader>1 :.!toilet -w 200 -f term -F border<CR>
                            
" vim-lsp
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~50%' }

" vim-quickrun
let g:quickrun_config={'*': {'split': ''}}

command! -nargs=0 Fq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'sink': 'cd'
\ })

" nerdtree
let NERDTreeShowHidden=1

" auto commands
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" cursor settings
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
hi CursorLine cterm=NONE ctermbg=black 
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Custom line control
call submode#enter_with('line-move', 'n', '', '<C-l>k', ':call MoveLineUp()<CR>')
call submode#enter_with('line-move', 'n', '', '<C-l>j', ':call MoveLineDown()<CR>')
call submode#map('line-move', 'n', '', 'j', ':call MoveLineDown()<CR>')
call submode#map('line-move', 'n', '', 'k', ':call MoveLineUp()<CR>')

" Custom functions
function! MoveLineUp()
    normal! m1yykPm2`1dd`2 
endfunction

function! MoveLineDown()
    normal! m1yyjpm2`1dd`2 
endfunction

" Home Device Control 
command! ToggleLight :call ToggleLight()
command! ToggleTV :call ToggleTV()

function! ToggleLight()
  let res = webapi#http#post($TOGGLE_LIGHT)
  if res.status == '200'
      echo 'Success'
  else
      echo res.status
  endif
endfunction

function! ToggleTV()
  let res = webapi#http#post($TOGGLE_TV)
  if res.status == '200'
      echo 'Success'
  else
      echo res.status
  endif
endfunction
