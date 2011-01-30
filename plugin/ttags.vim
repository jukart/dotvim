" ttags.vim -- Tag list browser (List, filter, preview, jump to tags)
" @Author:      Thomas Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-09-09.
" @Last Change: 2007-11-04.
" @Revision:    0.4.135
" GetLatestVimScripts: 2018 1 ttags.vim
"
" TODO:
" - Open in new window (split, vsplit, tab)
" - Fix preview

if &cp || exists("loaded_ttags")
    finish
endif
if !exists('g:loaded_tlib') || g:loaded_tlib < 19
    echoerr 'tlib >= 0.19 is required'
    finish
endif
let loaded_ttags = 4

let s:save_cpo = &cpo
set cpo&vim

TLet g:ttags_kinds   = ''
TLet g:ttags_name_rx = ''
TLet g:ttags_filename_rx = ''

" How to display the tags list. Can be one of: tlib, quickfix, locations
TLet g:ttags_display = 'tlib'

" The name of a function, which takes the filename as argument, that 
" rewrites the tag filename (e.g. in order to circumvent 
" incompatibilities between cygwin ctags & windows vim).
TLet g:ttags_rewrite = ''

" :nodefault:
" This variable can be buffer local.
"
" Filetype specfic highlighting can be defined as 
" g:ttags_highlighting_{&filetype}.
TLet g:ttags_highlighting = {
            \ 'a': 'Type',
            \ 'c': 'Special',
            \ 'f': 'Identifier',
            \ 'F': 'Constant',
            \ 'v': 'Statement',
            \ 'm': 'PreProc',
            \ }

" :nodefault:
TLet g:ttags_world = {
            \ 'type': 'si',
            \ 'query': 'Select tags',
            \ 'pick_last_item': 0,
            \ 'scratch': '__tags__',
            \ 'return_agent': 'ttags#GotoTag',
            \ 'key_handlers': [
                \ {'key': 16, 'agent': 'ttags#PreviewTag',  'key_name': '<c-p>', 'help': 'Preview'},
                \ {'key':  7, 'agent': 'ttags#GotoTag',     'key_name': '<c-g>', 'help': 'Jump (don''t close the list)'},
                \ {'key': 60, 'agent': 'ttags#GotoTag',     'key_name': '<',     'help': 'Jump (don''t close the list)'},
                \ {'key': 20, 'agent': 'ttags#InsertTemplate',  'key_name': '<c-t>', 'help': 'Insert template'},
            \ ],
            \ }
            " \ 'scratch_vertical': 1,
            " \ 'resize_vertical': '&co / 3',


" :display: TTags[!] [KIND] [TAGS_RX] [FILE_RX]
" See also |ttags#List()|.
command! -nargs=* -bang TTags call ttags#List(!empty('<bang>'), <f-args>)


" :display: TTagselect[!] kind:KIND FIELD:REGEXP ...
" For values of field see |taglist()|. These fields depend also on your 
" tags generator.
"
" If you want to automatically restict your searches to the current 
" namespace, you would have to write a function that determines the 
" namespace (and maybe e-mail it to me) and then call 
" |ttags#SelectTags()|.
"
" Examples:
"   " Show tags matching "bar" in class "Foo"
"   TTagselect name:bar class:Foo
command! -nargs=* -bang TTagselect call ttags#Select(!empty('<bang>'), <q-args>)


" With !, rebuild the tags list.
" command! -nargs=* -bang TTags call ttags#List(empty('<bang>'), <f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo

finish
CHANGES
0.1
Initial release

0.2
- The kind argument was introduced (i.e. the argument list has changed)
- * was defined as "match any".

0.3
- Configuration via [wbg]:ttags_kinds, [wbg]:ttags_tags_rx, 
[wbg]:ttags_file_rx variables
- The list includes the kind identifier and the entries are highlighted 
(see g:ttags_highlighting)
- If tSkeleton (vimscript #1160) is installed and if g:tskelTypes 
contains "tags", <c-t> will insert the tag in the buffer including (if 
supported by tSkeleton for the current filetype) a template for the 
argument list.
- g:ttags_world can be a normal dictionary (use tlib#input#ListD instead
of #ListW)
- Require tlib 0.14

0.4
- New: ttags#Select() that matches any field
- New: TTagselect command that takes a key list as argument to match any 
field.
- New: [wbg]:ttags_constraints configuration variable (a dictionary with 
regexps).
- If the commands TTags and TTagselect are called with [!], 
g:tlib_tags_extra is used to temporarily scan additional tag files.
- If a variable [bg]:ttags_rewrite is defined, it is used as function 
name to rewrite tag filesname (eg to prevent name incompatibilities 
between cygwin ctag & windows vim).
- "[wbg]:ttags_tags_rx" was renamed to "[wbg]:ttags_name_rx"
- "[wbg]:ttags_file_rx" was renamed to "[wbg]:ttags_filename_rx"
- g:ttags_display: Alternatively use "locations" or "quickfix" lists to 
display the tags (default: "tlib").
- Require tlib 0.19
- Previously, all tags were retrieved and filtered only later on. The 
idea was to save time by caching the tags information. Now the initial 
filtering by name is done by |taglist()| right away, which seems faster.

