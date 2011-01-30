" ============================================================================
" File:        proj.vim
" Description: Simple Vim project tool
" Maintainer:  Thomas Allen <tmallen at 703designs dot com>
" Last Change: June 17, 2009
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================
let s:ProjVersion = '0.2'

let g:ProjFileBrowser = 'VE'
let g:ProjFile = '~/.vimproj'

" Built in type ID for dict
let s:DictType = 4

fun! s:OpenProj(name)
    let project = s:ProjGetInfo(a:name)
    if type(project) == s:DictType
        exec 'cd ' . project['path']
        " Customization file is not required
        if has_key(project, 'vim') == 1
            exec 'so ' . project['vim']
        end
        exec g:ProjFileBrowser
    end
endf

fun! s:ProjGetInfo(name)
    try
        let s:Config = readfile(expand(g:ProjFile))
    catch /E484.*/
        exec s:echoError('Could not read project file "' . g:ProjFile . '"')
    endt

    let projects = {}
    let title = ''

    for line in s:Config
        let line = s:strip(line)
        if strlen(line) > 0
            if match(line, '[') == 0
                let title = strpart(line, 1, strlen(line) - 2)
                let projects[title] = {}
            else
                let option = map(split(line, '='), 's:strip(v:val)')
                let key = option[0]
                let projects[title][key] = option[1]
            end
        end
    endfo

    if has_key(projects, a:name) == 1
        return projects[a:name]
    else
        exec s:echoError('Project "' . a:name . '" not found in ' . g:ProjFile)
        return 0
    end
endf

" Stole these two functions from NERDTree
fun! s:echo(msg)
    redraw
    echomsg 'Proj: ' . a:msg
endf

fun! s:echoError(msg)
    echohl errormsg
    call s:echo(a:msg)
    echohl normal
endf
" But nothing else 

fun! s:strip(text)
    return substitute(a:text, '^\s\+|\s\+$', '', 'g')
endf

" Commands
command! -n=1 Proj :call s:OpenProj(<args>)

