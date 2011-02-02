" vim-pep8 - A Python filetype plugin to check pep8 convention.
"
" Before use, please make sure below.
"
" - vim is compiled with python.
" - put pep8 somewhere to be visible from this.
"
" Language:    Python (ft=python)
" Maintainer:  MURAOKA Yusuke <yusuke@jbking.org>
" Version:     0.1
" URL:         http://github.com/jbking/vim-pep8
"
" Thanks to pyflakes.vim. Almost inspired from you.

" Only do this when not done yet for this buffer
if exists("b:loaded_pep8_ftplugin")
    finish
endif
let b:loaded_pep8_ftplugin = 1

" The command to be used by this plugin
let s:pep8_cmd="pep8"

if !exists("b:did_pep8_init")
    python << EOF
import os
import sys
import vim
script_dir = os.path.dirname(vim.eval('expand("<sfile>")'))
sys.path.insert(0, script_dir)

# Must be imported
from pep8checker import Pep8Checker

def vim_quote(s):
    return s.replace("'", "''")
EOF
    let b:did_pep8_init = 1
endif

function! s:ClearPep8()
    let s:matches = getmatches()
    for s:matchId in s:matches
        if s:matchId['group'] == 'Pep8'
            call matchdelete(s:matchId['id'])
        endif
    endfor
    let b:pep8_matchedlines = {}
    let b:pep8_cleared = 1
endfunction

function! s:RunPep8()
    highlight link Pep8 SpellBad

    if exists("b:pep8_cleared")
        if b:pep8_cleared == 0
            silent call s:ClearPep8()
            let b:pep8_cleared = 1
        endif
    else
        let b:pep8_cleared = 1
    endif

    let b:pep8_matchedlines = {}
    python << EOF
cmd = vim.eval('string(s:pep8_cmd)')
for (lineno, description) in Pep8Checker(cmd, vim.current.buffer).check():
    vim.command("let s:matchDict = {}")
    vim.command("let s:matchDict['lineNum'] = " + lineno)
    vim.command("let s:matchDict['message'] = '%s'" % vim_quote(description))
    vim.command("let s:mID = matchadd('Pep8', '\%" + lineno + "l\\n\@!')")
    vim.command("let b:pep8_matchedlines[" + lineno + "] = s:matchDict")
EOF
    let b:pep8_cleared = 0
endfunction

let b:pep8_showing_message = 0
function! s:GetPep8Message()
    let s:cursorPos = getpos(".")

    " Bail if RunPep8 hasn't been called yet.
    if !exists('b:pep8_matchedlines')
        return
    endif

    " if there's a message for the line the cursor is currently on, echo
    " it to the console
    if has_key(b:pep8_matchedlines, s:cursorPos[1])
        let s:pep8Match = get(b:pep8_matchedlines, s:cursorPos[1])
        call s:WideMsg(s:pep8Match['message'])
        let b:pep8_showing_message = 1
        return
    endif

    " otherwise, if we're showing a message, clear it
    if b:pep8_showing_message == 1
        echo ""
        let b:pep8_showing_message = 0
    endif
endfunction

" WideMsg() prints [long] message up to (&columns-1) length
" guaranteed without "Press Enter" prompt.
function! s:WideMsg(msg)
    let x=&ruler | let y=&showcmd
    set noruler noshowcmd
    redraw
    echo a:msg
    let &ruler=x | let &showcmd=y
endfun

augroup plugin-vim-pep8
    autocmd!
    autocmd BufEnter,BufWritePost <buffer> call s:RunPep8()
    autocmd CursorHold,CursorHoldI <buffer> call s:RunPep8()
    autocmd InsertLeave <buffer> call s:RunPep8()

    autocmd BufLeave <buffer> call s:ClearPep8()

    autocmd CursorHold,CursorMoved <buffer> call s:GetPep8Message()
augroup END

" In same situation as pyflakes.vim
noremap <buffer><silent> dd dd:Pep8Update<CR>
noremap <buffer><silent> dw dw:Pep8Update<CR>
noremap <buffer><silent> u u:Pep8Update<CR>
noremap <buffer><silent> <C-R> <C-R>:Pep8Update<CR>


function! s:Pep8Update()
    silent call s:RunPep8()
    call s:GetPep8Message()
endfunction

" Call this function in your .vimrc to update Pep8 state.
if !exists(":Pep8Update")
  command Pep8Update :call s:Pep8Update()
endif
