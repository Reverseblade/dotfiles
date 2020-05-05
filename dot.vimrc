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
"NeoBundle 'rhysd/vim-syntax-christmas-tree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sonph/onehalf', {'rtp': 'vim/'}
NeoBundle 'takac/vim-hardtime'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/Align'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" basic settings
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

" keymap
let mapleader = ','
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap ( ()<LEFT>
"inoremap < <><LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<left>
"inoremap jh <Esc>
nnoremap <leader>ht :HardTimeToggle<CR>
nnoremap ae a <esc>
nnoremap oe o <esc>
nnoremap ae a <esc>
nnoremap oe o<Esc>
nnoremap sh :split<CR>
nnoremap sv :vsplit<CR>
"nnoremap w! :w!<CR>
nnoremap wh <C-w>h
nnoremap wj <C-w>h
nnoremap wk <C-w>k
nnoremap wl <C-w>l
"nnoremap wq :wq<CR>
"nnoremap wq! :wq!<CR>
noremap <S-h>   ^
noremap <S-l>   $
noremap <S-s> :s/
noremap <leader>f :Files<CR>
noremap <leader>fc :Files ~/Code<CR>
noremap <leader>fd :Files ~/dotfiles<CR>
noremap <leader>t :tab new<CR>
noremap nt :NERDTreeToggle<CR>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
vnoremap <leader>s :sort<CR>
vnoremap jh <Esc>

" jedi-vim 
let g:jedi#completions_command = "<C-j>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "<C-k>"

autocmd FileType python setlocal completeopt-=preview

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'

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

" SQLUtilities 
vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

let g:sqlfmt_command = "sqlfmt"
let g:sqlfmt_options = ""

let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"

let g:sqlutil_non_line_break_keywords = ['insert']

" local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"auto commands
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python nmap <leader>c ]]zt 
autocmd FileType python nmap <leader>C [[zt

" cursor settings
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
hi CursorLine cterm=NONE ctermbg=black 
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" vim-lsp settings 
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
