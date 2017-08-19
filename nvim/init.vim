" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" for global config
Plug 'editorconfig/editorconfig-vim'

" Commenter
Plug 'tomtom/tcomment_vim'

" Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
" Bundle 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-leiningen'

""" Prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

""" Latex 
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'

""" Pandoc
Plug 'pyarmak/vim-pandoc-live-preview'

"Editing parentesi
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people' 
"Parentesi arcobaleno
" Plugin 'oblitum/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'klen/python-mode'
Plug 'kchmck/vim-coffee-script'

Plug 'mattn/emmet-vim'


"Base16
Plug 'chriskempson/base16-vim'

"File browser
Plug 'scrooloose/nerdtree'
" fuzzy file finder
Plug 'kien/ctrlp.vim'
" quick in-file movement
Plug 'Lokaltog/vim-easymotion'
"Cool start screen
Plug 'mhinz/vim-startify'

call plug#end()    
" }}}

" {{{ General 
set number
filetype off
filetype plugin indent on

set t_Co=256
set background=dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

syntax enable
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set shiftwidth=4
set expandtab

set title
set titleold=urxvt
autocmd BufEnter * let &titlestring = expand("%:t")
" }}}

" {{{ Filetype specific

augroup vimrc
    au bufwinenter setlocal foldmethod=manual
augroup end

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif
augroup END

autocmd Filetype java set makeprg=javac\ %
autocmd Filetype c set makeprg=make
autocmd Filetype c set foldmethod=syntax


" Prose stuff
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,text,tex call pencil#init({'wrap': 'soft'})
    "autocmd FileType markdown,mkd,tex Goyo
    "autocmd FileType markdown,mkd,tex Limelight
    "autocmd FileType tex :LLPStartPreview
augroup END

" {{{ Clojure 
"  Automagic Clojure folding on defn's and defmacro's
function GetClojureFold()
    if getline(v:lnum) =~ '^\s*(defn.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*$'
        let my_cljnum = v:lnum
        let my_cljmax = line("$")

        while (1)
            let my_cljnum = my_cljnum + 1
            if my_cljnum > my_cljmax
                return "<1"
            endif

            let my_cljdata = getline(my_cljnum)

            " If we match an empty line, stop folding
            if my_cljdata =~ '^$'
                return "<1"
            else
                return "="
            endif
        endwhile
    else
        return "="
    endif
endfunction

function TurnOnClojureFolding()
    setlocal foldexpr=GetClojureFold()
    setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()
" }}} Clojure

" }}}

" {{{ Plugin Specific
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_enabled = 0

" {{{ Pymode
let g:pymode_rope = 0

" documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'k'

"linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" auto check on save
let g:pymode_lint_write = 1

" support virtualenv
let g:pymode_virtualenv = 1

" enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" don't autofold code
let g:pymode_folding = 1 
" }}} 

" {{{ Startify
let g:startify_bookmarks = ['~/Dropbox/programming/exercises/projecteuler', '~/.config/nvim/init.vim']
let g:startify_list_order = [
            \ ['   These are my bookmarks:'],
            \ 'bookmarks',
            \ ['   My most recently', '   used files'],
            \ 'files',
            \ ['   My most recently used files in the current directory:'],
            \ 'dir',
            \ ['   These are my sessions:'],
            \ 'sessions',
            \ ]

let g:startify_custom_header =
            \ map(split(system('fortune -c | cowthink -f $(find /usr/share/cows -type f | shuf -n 1)'), '\n'), '"   ". v:val') + ['','']

" }}}

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

autocmd FileType html,css imap <tab> <plug>(emmet-expand-abbr)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:NERDCustonDelimiters = {
            \ 'python': {'right': '# '}}

" }}}

" {{{ Mappings 
" Display TODO
nnoremap <leader>TODO :vimgrep TODO **/*.py

" Tab split more comodo
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" map <F9> :make<Return>:copen<Return>
map <F9> :lclose<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <F5> :!java %:r
" for unimparied
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" to move by screeen line
" :noremap <Up> gk
" :noremap! <Up> <C-O>gk
" :noremap <Down> gj
" :noremap! <Down> <C-O>gj
" the following are optional, to move by file lines using Alt-arrows
" :noremap <M-k> gk
" :noremap <M-j> gj
" :noremap <M-Up> k
" :noremap <M-Down> j
"
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
imap jj <Esc>
map <f2> :NERDTreeToggle<cr>
" }}}
