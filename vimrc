set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/vim-easymotion'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'bling/vim-airline'
Bundle 'jaromero/vim-monokai-refined'
Bundle 'mattn/emmet-vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/javacomplete'
Bundle 'rking/ag.vim'
" Snippets begin
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
" Snippets end
Bundle "jnurmine/Zenburn"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'

" All of your plugins must be added before the following line
call vundle#end()				" required
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

" Enable emmet just for a subset of files that might need it
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml,xsd,xsl,java EmmetInstall

runtime macros/matchit.vim    " enable Matchit

syntax on          " enable colors
colorscheme molokai
set hlsearch       " highlight search (very useful!)
set incsearch      " search incremently (search while typing)
set number
set bg=dark	" most terminals have a dark background
set cursorline	" highlight current line

set ignorecase	" searches are case insensitive
set smartcase	" ... unless they contain at least one capital letter

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.exe,.svn,*.gem,*.pyo,*.pyc

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore Java files
set wildignore+=*.class,*.jar,*.war,*.ear

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set mouse=a
set hidden	" so can swap buffers without writing them
set showmatch   " Show matching bracket
set matchtime=2 " show matching bracket for 0.2 seconds
set showmode    " show mode in status bar (insert/replace/...)
set showcmd     " show typed command in status bar
set ruler       " show cursor position in status bar
set title       " show file in titlebar
set wildmenu    " completion with menu
set laststatus=2        " use 2 lines for the status bar
set matchpairs+=<:>     " specially for html
set smartindent " smart auto indenting
set smarttab    " smart tab handling for indenting
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
" set nowrap	" don't wrap lines
set linespace=2
" set gdefault	"  always apply substitutions globally

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
								  "
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
" Default ftp transfers to 'ascii'
let g:netrw_ftpsave = "ascii"

set history=200
set udf
if has('win32')
  set directory=$TEMP//
  set backupdir=$TEMP//
  " Turn on undo history for files, store them in temp dir
  " Note that this mightn't work for filename collisions
  set udir=$TEMP//
else
  set directory=/tmp//
  set backupdir=/tmp//
  set udir=/tmp//
endif

" So that history filtering works for C-p/n
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Stop F1 opening Help, 'cos I keep hitting it accidentally instead of Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <C-h> :nohl<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>i
" Quick ESC
imap jj <ESC>
inoremap <S-CR> <ESC>	" Shift-Return to leave Insert mode
vnoremap <C-c> "+y
" Shift-Insert is alread mapped to 'Paste' (and Ctrl-Insert is 'Copy')

" NERDTree mappings
" nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
" nnoremap <silent> <leader>nb :NERDTreeFromBookmark<CR>
" nnoremap <silent> <leader>nf :NERDTreeFind<CR>zz

" Make searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" Type %% in Vim's command line, automatically expands to path of active
" buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


if has ("autocmd")
  " change to directory of current file automatically
  " autocmd BufEnter * lcd %:p:h

  " Put these in an autocmd group, so that we can delete them easily.
  augroup mysettings
    au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
    au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

    " Conform to PEP8
    au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
  augroup END


  augroup perl
    " reset (disable previous 'augroup perl' settings)
    au!  

    au BufReadPre,BufNewFile
    \ *.pl,*.pm
    \ set formatoptions=croq smartindent shiftwidth=2 softtabstop=2 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
    " formatoption:
    "   t - wrap text using textwidth
    "   c - wrap comments using textwidth (and auto insert comment leader)
    "   r - auto insert comment leader when pressing <return> in insert mode
    "   o - auto insert comment leader when pressing 'o' or 'O'.
    "   q - allow formatting of comments with "gq"
    "   a - auto formatting for paragraphs
    "   n - auto wrap numbered lists
    "   

	" Who uses modula2? All .md files should be treated as Markdown
	au BufReadPre,BufNewFile *.md set filetype=markdown
  augroup END

  " OmniComplete
  set ofu=syntaxcomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType java set omnifunc=javacomplete#Complete
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  imap </ </<C-X><C-O>
  imap <C-Space> <C-X><C-O>


  " Always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside
  " an event handler (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 

endif " has("autocmd")

"
" CtrlP
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', 'gradle.build', 'grailsw', '.project', '.idea']

" PyMatcher for CtrlP
if !has('python')
	echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
	let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350
" Do not clear filenames cache, to improve CtrlP startup
" You can manuall y clear it with <F5>
" let g:ctrlp_clear_cache_on_exit = 0
" Set no file limit
let g:ctrlp_max_files = 0
" If ag is available use it as a filename list generator instead of 'find'
if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --skip-vcs-ignores --hidden -g ""'
endif

