set nocompatible

"-----------------------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/globalreplace.vim'
Bundle 'itspriddle/vim-jquery'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rking/ag.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'wincent/Command-T'
"Bundle 'tienle/vim-itermux'
Bundle 'jgdavey/vim-turbux'
Bundle 'jgdavey/tslime.vim'
Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-cucumber'
Bundle 'christoomey/vim-tmux-navigator'

" vim-scripts repos
Bundle 'L9'
Bundle 'vis'
Bundle 'bocau'
Bundle 'YankRing.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Rainbow-Parenthesis'
Bundle 'groenewege/vim-less'
"Bundle 'jeffkreeftmeijer/vim-numbertoggle'

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
set history=1024
set cf                                " enable error files and error jumping
set ffs=unix,dos,mac                  " support these files
filetype plugin indent on
set isk+=_,$,@,%,#,-
set modeline
set autoread                          " reload file
set tabpagemax=50                     " open 50 tabs max
set splitbelow
set splitright
set complete-=i
if version>=730
  set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp
  set undofile
  set undolevels=1000
endif


"-----------------------------------------------------------------------------
" Colors/ Theme
"-----------------------------------------------------------------------------
if !has("gui_running")
  set t_Co=256
  if !has('mac')
    "set term==screen-256color
  endif
endif

"if &term =~ '256color'
  "set t_ut=
"endif

syntax enable

let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_visibility='high'
let g:solarized_termtrans=1
colorscheme solarized
"color bocau
set background=dark

if !has('mac')
  set guifont=ProggyCleanTT\ 14
else
  set guifont=Menlo:h13
endif

if has("syntax")
  syntax on
endif

set hls                               " Highlighting search result

"-----------------------------------------------------------------------------
" Backup
"-----------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

"-----------------------------------------------------------------------------
" UI
"-----------------------------------------------------------------------------
set ruler                             " show cursor position all the time
set nolazyredraw
set number                            " set line number on
set wildmenu
set ch=1                              " command line height
set backspace=indent,eol,start        " backspace through everything in insert mode
set report=0                          " tell us about changes
set guioptions=aegitcm
"win 180 50
set mousehide                         " hide mouse after chars typed
set mouse=a                           " mouse in all modes
set ttymouse=xterm

map <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[65~ <S-ScrollWheelDown>

if has('statusline')
  set laststatus=2                    " always show status line

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  "set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  "set statusline+=\ [%{getcwd()}]          " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"-----------------------------------------------------------------------------
" Visual cues
"-----------------------------------------------------------------------------
set showmatch
set incsearch
set ignorecase                        " case insensitive search
set mat=5                             " bracket blinking
set novisualbell                      " no blinking

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre * :%s/\s\+$//e

autocmd Filetype gitcommit setlocal spell textwidth=72

"-----------------------------------------------------------------------------
" Text formatting
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set nowrap
set tabstop=2
set softtabstop=2
set nosmarttab
set formatoptions+=n
set shiftwidth=2
set encoding=utf-8
set vb t_vb=
set virtualedit=all
"set textwidth=80
set smartcase
set expandtab
set list
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\`\             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
"set clipboard+=unnamed                  " yanks go on clipboard instead
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent

"-----------------------------------------------------------------------------
" Mapping keys
"-----------------------------------------------------------------------------
" remap Leader to , instead of \
let mapleader = ","

"save
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if has("gui_macvim") && has("gui_running")
  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i
else
  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i
endif

" format the entire file
map === mmgg=G`m^zz

nmap <Leader>gr :call MISC_GlobalReplace()<cr>

nmap <leader>q :bd<CR>

" close quickfix window
nmap <leader>x :ccl<CR>

nmap <leader>w :w<CR>

nmap <CR> :write<CR>

if has("gui_macvim") && has("gui_running")
  map <D-J> :m +1 <CR>
  map <D-K> :m -2 <CR>
  map <D-j> 4j
  map <D-k> 4k
  vnoremap <D-J> dp'[V']
  vnoremap <D-K> dkP'[V']
  "move to next/previous line with same indentation
  nnoremap <D-,> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
  nnoremap <D-.> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^
  " RSI preventions
  imap <silent> <D-k> _
  nnoremap <D-'> ci'
  imap <D-'> <Esc>ci'
  nnoremap <D-"> ci"
  imap <D-"> <Esc>ci"
else
  map <M-J> :m +1 <CR>
  "map <M-K> :m -2 <CR>
  "map <C-j> 4j
  "map <C-k> 4k
  vnoremap <M-J> dp'[V']
  vnoremap <M-K> dkP'[V']
  "move to next/previous line with same indentation
  nnoremap <M-,> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
  nnoremap <M-.> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^
  " RSI preventions
  imap <silent> <M-k> _
  nnoremap <M-'> ci'
  imap <M-'> <Esc>ci'
  nnoremap <M-"> ci"
  imap <M-"> <Esc>ci"
endif
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> vv <C-w>v
"noremap H ^
"noremap L $
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeToggle<CR>
"nmap <tab> v>

"vmap <tab> >gv
"vmap <tab> >gv
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>


"a trick for sudo save
cmap w!! w !sudo tee % >/dev/null

" map esc
"imap ;; <Esc>
imap jj <Esc>
imap jk <Esc>

"Remap VIM 0
noremap 0 ^
noremap ^ 0

" make Y consistent with C and D
nnoremap Y y$

"Ctrl + Space to auto complete on local buff
imap <C-Space> <C-P>

"Expand current file's path
cnoremap <C-F> <C-R>=expand('%:p:h')<CR>

nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gA :Ag! <cword><CR>

let g:ctrlp_map = '<Leader><Space>'
"let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let MRU_Max_Entries = 400

nnoremap <silent> <F4> <Esc>:ClearCtrlPCache<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
nnoremap <Leader>u :ClearCtrlPCache<CR>
nnoremap <Leader>j :CtrlPMRU<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <leader>ec :CtrlP app/controllers<cr>
nnoremap <leader>es :CtrlP spec/<cr>
nnoremap <leader>em :CtrlP app/models<cr>
nnoremap <leader>ev :CtrlP app/views<cr>

nnoremap <F5> :GundoToggle<CR>

nnoremap <Space> za
vnoremap <Space> za

" Skip to Model, View or Controller
map <Leader>rm :Rmodel
map <Leader>rv :Rview
map <Leader>rc :Rcontroller

"map // <plug>NERDCommenterToggle
map <Leader>c<space> <plug>NERDCommenterToggle

" Duplicate a selection in Visual mode: D
vmap D y'>p

set wildignore+=*.o,*.obj,.git

"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

"Ctrl + S to save
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" Toogle buffer zoom
map <Leader>zw <C-w>o

" make Y consistent with C and D
nnoremap Y y$

"Ctrl + Space to auto complete on local buff
imap <C-Space> <C-P>

" Resize splits like a boss
nnoremap <S-Up> :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <S-Down> :exe "resize " . (winheight(0) * 10/11)<CR>
nnoremap <S-Left> :exe "vertical resize " . (winwidth(0) * 10/11)<CR>
nnoremap <S-Right> :exe "vertical resize " . (winwidth(0) * 11/10)<CR>

"autotest
"nmap <Leader>fd :cf /tmp/autotest.txt<CR> :compiler rubyunit<CR>

"zeus rspec test
map <Leader>z :call RunTestInZeus(expand('%'))<CR>
map <Leader>Z :call RunTestInZeus(expand('%'). ':' . line('.'))<CR>
"map <Leader>L :SweetSpecRunLast<CR>


"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
" Edit .vimrc
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.hamlc setfiletype haml
au! BufRead,BufNewFile *.rabl setfiletype ruby

"auto open NERDTree when start
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"NERD Tree
"let g:NERDCreateDefaultMappings=0
"let g:NERDSpaceDelims=1
"let g:NERDShutUp=1
"let g:NERDTreeHijackNetrw=0

"-----------------------------------------------------------------------------
" Ruby related
"-----------------------------------------------------------------------------
compiler rubyunit
let g:rubytest_in_quickfix = 0              " minimal ruby test error message
let g:rubytest_cmd_test = "ruby %p"
let g:rubytest_cmd_testcase = "ruby %p -n '/%c/'"
let g:rubytest_cmd_spec = "spec -f specdoc %p"
let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"
let g:rubytest_cmd_feature = "cucumber %p"
let g:rubytest_cmd_story = "cucumber %p -n '%c'"
"au Filetype ruby call Foldsearch("")
au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'


let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let g:rails_ctags_arguments = "`gem env gemdir`/gems"
set tags=tags;/
let g:rails_ctags_arguments = "`gem env gemdir`/gems"

"auto update ctags after file was saved
au BufWritePost .rb,.c,.cpp,*.h silent! !ctags -R &
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/gem/**;vendor/plugins/**;coverage/**;tmp/**;rdoc/**"
let g:fuf_splitPathMatching=1

" Auto indicating changes
"let g:changes_autocmd=1
let g:changes_vcs_system='git'

"Mini buffer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplSplitBelow = 0

" Indent guides
"let g:indent_guides_guide_size = 1
"
" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

let g:no_itermux_mappings = 1
let g:itermux_session_name = 'rspec'
let g:rspec_drb = 1
"if has('mac')
  "nmap <leader>T <ESC>:call SendTestToiTerm(expand('%'))<CR>
  "nmap <leader>t <ESC>:call SendFocusedTestToiTerm(expand('%'), line('.'))<CR>
"endif

" Powerline theme
let g:Powerline_symbols     = 'fancy'
"let g:Powerline_theme       = 'skwp'
"let g:Powerline_colorscheme = 'skwp'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

function! RunTestInZeus(test_file)
  exec "!zeus rspec --no-color " . a:test_file
endfunction

"  ---------------------------------------------------------------------------
"  Easymotion
"  ---------------------------------------------------------------------------
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_mapping_f  = '//'
let g:EasyMotion_mapping_F  = '<Leader>F'
let g:EasyMotion_keys       = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
let g:EasyMotion_do_shade   = 1


"  ---------------------------------------------------------------------------
"  When vimrc, either directly or via symlink, is edited, automatically reload it
"  ---------------------------------------------------------------------------
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %


"  ---------------------------------------------------------------------------
"  Other files to consider Ruby
"  ---------------------------------------------------------------------------
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby


"  ---------------------------------------------------------------------------
"  CoffeeScript
"  ---------------------------------------------------------------------------

let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

"  ---------------------------------------------------------------------------
"  SASS / SCSS
"  ---------------------------------------------------------------------------

au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

"  ---------------------------------------------------------------------------
"  If cursor is in first or last line of window, scroll to middle line.
"  ---------------------------------------------------------------------------
nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>
nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>

function! s:MaybeMiddle()
  if winline() < 3 || winline() > winheight(0) - 3
    normal! zz
  endif
endfunction

"  ---------------------------------------------------------------------------
"  Folding
"  ---------------------------------------------------------------------------
"set foldmethod=syntax
"set foldnestmax=10
"set nofoldenable                        "don't fold by default
"set foldlevel=1
"setl foldtext=CustomFoldText()

"fu! CustomFoldText()
  ""get first non-blank line
  "let fs = v:foldstart
  "while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  "endwhile
  "if fs > v:foldend
    "let line = getline(v:foldstart)
  "else
    "let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  "endif

  "let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  "let foldSize = 1 + v:foldend - v:foldstart
  "let foldSizeStr = " " . foldSize . " lines "
  ""let foldLevelStr = repeat("+--", v:foldlevel)
  "let foldLevelStr = ''
  "let lineCount = line("$")
  "let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  "let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  "return line . expansionString .  foldSizeStr . foldPercentage .  foldLevelStr
"endf

"  ---------------------------------------------------------------------------
"  Tmux configuration
"  ---------------------------------------------------------------------------
let g:turbux_runner            = 'tslime'
let g:turbux_command_rspec     = 'rspec'
let g:turbux_command_test_unit = 'ruby'
let g:turbux_command_cucumber  = 'cucumber'
let g:turbux_command_turnip    = 'rspec'

