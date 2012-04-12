" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"

call pathogen#infect()

let maplocalleader='_'
let mapleader='-'

" remove whitespaces at end of lines
map <leader>rws :%s/  *$//g<CR>

nmap <F3> <C-w>w
nmap <F2> <C-w>W

nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>

" ,e -- edit file, starting in same directory as current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,s :sp <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabnew <C-R>=expand("%:p:h") . "/" <CR>
" ,l -- window local cd to the directory of the open file
map ,l :lcd <C-R>=expand("%:p:h")<CR><CR>

" persistent undo buffer only for files in ~/
au BufWritePre ~/* setlocal undofile

" always use utf-8
set encoding=utf-8
set fileencoding=utf-8

" set guifont=Monaco:h12
set guifont=Courier\ New:h16
set antialias

set background=dark

set tabstop=4
set et
set sw=4
set smarttab
set wrap
set textwidth=0

" the following is to configure search
" set ignorecase
" set smartcase

set number
set numberwidth=5

set wildignore=*.pyc

set fileformat=unix

let g:VCSCommandSVNExec = '/opt/local/bin/svn'

" netrw
let g:netrw_list_hide = "^.*pyc$,^.*\\~$,\.svn\/$,\.swp"
let g:netrw_sort_sequence = "[\/]$,\.zcml$,\.py$,\.pt$,\.txt$,\.html$,\.bak$,\.o$,\.h$,\.info$,\.swp$,\.obj$,*"

" Command-t
let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 25
nmap <F12> :CommandT<CR>

" VimWiki
let g:vimwiki_home = '~/vimwiki/'
let g:vimwiki_html_header = '~/vimwiki/templates/header.html'
let g:vimwiki_html_footer = '~/vimwiki/templates/footer.html'

" VImExplorer
let g:VEConf_filePanelSortType = 1
let g:VEConf_pythonPackage = '/Users/jukart/sandbox/'
let g:VEConf_showFolderStatus = 0
""  let g:VEConf_filePanelFilter = '*[^~]'

" python-mode-ken
let g:pymode_folding = 0
let g:pymode_lint_checker = "pyflakes,mccabe"
"let g:pymode_lint_cwindow = 0

" autotag
let g:autotagVerbosityLevel = 2

autocmd VimEnter * set vb t_vb=

" automatically change to the directory of the current file
" autocmd BufEnter * lcd %:p:h


let g:dbext_default_profile_fbn = 'type=PGSQL:user=fbn:dbname=fbn:host=localhost:port=14339'
let g:dbext_default_profile_fbndebug = 'type=PGSQL:user=jukart:dbname=test_fbn:host=localhost:port=15432'
let g:dbext_default_profile_mklocal = 'type=PGSQL:user=jukart:dbname=marketizer_mk-dev:host=localhost:port=14338'
let g:dbext_default_profile_mkdebug = 'type=PGSQL:user=jukart:dbname=mkDBLayer:host=localhost:port=15432'
let g:dbext_default_profile_azlocal = 'type=PGSQL:user=jukart:dbname=az:host=localhost:port=14339'
let g:dbext_default_profile_azdebug = 'type=PGSQL:user=jukart:dbname=azDBLayer:host=localhost:port=15432'
let g:dbext_default_profile_az_8703 = 'type=PGSQL:user=az:dbname=az:host=localhost:port=8703'
let g:dbext_default_profile_localdebug = 'type=PGSQL:user=jukart:dbname=TestPGLayer:host=localhost:port=15432'
let g:dbext_default_profile_sl = 'type=MYSQL:user=root:dbname=assets:host=127.0.0.1:port=33306'
"let g:dbext_default_profile = 'az'
let g:dbext_default_type = 'PGSQL'
let g:dbext_default_user = 'jukart'
let g:dbext_default_host = 'localhost'

let g:dbext_default_use_sep_result_buffer = 1

" code_complete parameter
let g:user_defined_snippets = "$VIMRUNTIME/my_snippets.vim"
let g:code_completekey = "<D-lt>"

let g:TagsParserTagsProgram = "/opt/local/bin/ctags"

" winManager
" let g:winManagerWindowLayout = 'FileExplorer,Workspace,TagsExplorer|BufExplorer'
let g:winManagerWindowLayout = 'FileExplorer,TagList,TagsExplorer|BufExplorer'
let g:winManagerWidth = 60 
let g:favDirs = '/Users/jukart/writeable-zope3'

" minBufExplorer :
let g:miniBufExplorerMoreThanOne=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:minBufExplVSplit=20

let python_highlight_all = 1

" Objective j 
set runtimepath+=~/.vim/vim-objj
au BufNewFile,BufRead *.j,Jakefile setf objj

autocmd BufNewFile,BufRead *.j set tabstop=4
autocmd BufNewFile,BufRead *.j set nowrap
autocmd BufNewFile,BufRead *.j set go+=b
autocmd BufNewFile,BufRead *.j set autoindent

" jint
autocmd FileType javascript set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/Users/jukart/bin/jsl.conf'\ -process\ %
autocmd FileType javascript set errorformat=%f(%l):\ %m^M

" autocmd FileType python set omnifunc=pythoncomplete#Complete

" autocmd FileType python set complete+=k/Users/jukart/.vim/pydiction iskeyword+=.,

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<cr>
autocmd BufRead *.py nmap <F4> oimport pdb; pdb.set_trace()<esc>

autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set textwidth=78
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b

autocmd BufRead *.pt set wrap
autocmd BufRead *.pt set tabstop=2

autocmd BufRead *.txt set tabstop=4
autocmd BufRead *.txt set textwidth=78
autocmd BufRead *.txt set nowrap
autocmd BufRead *.txt set go+=b

autocmd BufRead *.rst set tabstop=4
autocmd BufRead *.rst set textwidth=78
autocmd BufRead *.rst set nowrap
autocmd BufRead *.rst set go+=b

autocmd BufRead *.zcml set ft=xml
autocmd BufRead *.zcml set textwidth=0
" au FileType zcml,xml exe ":silent 1,$!tidy --input-xml true -q"

autocmd BufRead *.c set tabstop=4

autocmd BufRead *.csv set ft=csv
autocmd BufRead *.csv set textwidth=0
autocmd BufRead *.csv set wrap

au BufRead,BufNewFile *.woim set filetype=woim

" ---------------------------------------------------------------------------
:source ~/.vim/abbreviations.vim

" ---------------------------------------------------------------------------
" status line 
set laststatus=2
if has('statusline')
        " Status line detail: (from Rafael Garcia-Suarez)
        " %f		file path (relative)
        " %F		file path (full)
        " %y		file type between braces (if defined)
        " %([%R%M]%)	read-only, modified and modifiable flags between braces
        " %{'!'[&ff=='default_file_format']}
        "			shows a '!' if the file format is not the platform
        "			default
        " %{'$'[!&list]}	shows a '*' if in list mode
        " %{'~'[&pm=='']}	shows a '~' if in patchmode
        " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
        "			only for debug : display the current syntax item name
        " %=		right-align following items
        " #%n		buffer number
        " %l/%L,%c%V	line number, total number of lines, and column number
        function! SetStatusLineStyle()
                if &stl == '' || &stl =~ 'synID'
                        let &stl="%F %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=%{fugitive#statusline()}#%n %l/%L,%c%V "
                else
                        let &stl="%F %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
                endif
        endfunc

        call SetStatusLineStyle()
        if has('title')
                set titlestring=%t%(\ [%R%M]%)
        endif

        highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
        highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
endif

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

function! DoPrettyJSON()
python << EOF
import vim, json
b = vim.current.buffer
for l in json.dumps(json.loads(vim.current.line), indent=4).split('\n'):
    b.append(l)
EOF
endfunction
command! PrettyJSON call DoPrettyJSON()

function! s:diff()
    let tmpa = tempname()
    let tmpb = tempname()
    earlier 100h
    exec 'w '.tmpa
    later 100h
    exec 'w '.tmpb
    update
    exec 'tabnew '.tmpa
    diffthis
    vert split
    exec 'edit '.tmpb
    diffthis
endfunction
command! -nargs=0 DIFF call <SID>diff()

