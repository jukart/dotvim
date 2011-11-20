
colorscheme jukart
set background=dark   " adapt colors for dark background

"colorscheme solarized

"function! ToggleBackground()
"  if (w:solarized_style=="dark")
"    let w:solarized_style="light"
"    colorscheme solarized
"  else
"    let w:solarized_style="dark"
"    colorscheme solarized
"  endif
"endfunction
"command! Togbg call ToggleBackground()
"nnoremap <S-F1> :call ToggleBackground()<CR>
"inoremap <S-F1> <ESC>:call ToggleBackground()<CR>a
"vnoremap <S-F1> <ESC>:call ToggleBackground()<CR>

:set lines=57
:set columns=120

set guioptions-=T  " don't show toolbar

" ---------------------------------------------------------------------------
" spelling...
if v:version >= 700
  function! ToggleSpell()
    if &spell == 1
      let b:lastspelllang=&spelllang
      setlocal spell!
    elseif b:lastspelllang
      setlocal spell spelllang=b:lastspelllang
    else
      setlocal spell spelllang=en
    endif
  endfunction

  nmap <LocalLeader>ss :call ToggleSpell()<CR>

  setlocal spell spelllang=en
endif

