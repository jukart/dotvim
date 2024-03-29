if exists("g:jukart_style")
    let s:jukart_style = g:jukart_style
else
    let s:jukart_style = &background
endif

execute "command! -nargs=1 Colo let g:jukart_style = \"<args>\" | colo jukart"

if s:jukart_style == "black" || s:jukart_style == "dark" || s:jukart_style == "darkslategray"
    set background=dark
elseif s:jukart_style == "light" || s:jukart_style == "white"
    set background=light
else
    let s:jukart_style = &background 
endif

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "jukart"

hi LineProximity guibg=#293535
hi LineOverflow guibg=#3F5556

if &background == "dark"
    hi ClassName guibg=bg guifg=indianred gui=none
    hi DefinedName guibg=bg guifg=Yellow gui=none
    hi Enumerator guibg=bg guifg=Yellow gui=none
    hi Function guibg=bg guifg=LightGreen gui=none
    hi EnumerationName guibg=bg guifg=Yellow gui=none
    hi Member guibg=bg guifg=violet gui=none
    hi Union guibg=bg guifg=Red gui=none
    hi GlobalConstant guibg=bg guifg=Red gui=none
    hi GlobalVariable guibg=bg guifg=Red gui=none

    if s:jukart_style == "darkslategray"
        hi Normal ctermbg=0 ctermfg=7 guibg=#2f4f4f guifg=#d0d0d0 gui=none

        hi CursorColumn guibg=#404040 gui=none
        hi CursorLine guibg=#404040 gui=none
        hi FoldColumn ctermbg=bg guibg=bg guifg=#a0c0c0 gui=none
        hi Folded guibg=#585858 guifg=#c0e0e0 gui=none
        hi LineNr term=bold cterm=NONE ctermfg=black ctermbg=yellow gui=NONE guifg=black guibg=lightyellow
        hi NonText ctermfg=8 guibg=bg guifg=#a0c0c0 gui=bold
        hi Pmenu guibg=#80a0a0 guifg=#000000 gui=none
        hi PmenuSbar guibg=#608080 guifg=fg gui=none
        hi PmenuThumb guibg=#c0e0e0 guifg=bg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#a0c0c0 gui=none
        hi StatusLine ctermbg=7 ctermfg=0 guibg=#507070 guifg=fg gui=bold
        hi StatusLineNC ctermbg=8 ctermfg=0 guibg=#406060 guifg=fg gui=none
        hi TabLine guibg=#567676 guifg=fg gui=underline
        hi TabLineFill guibg=#567676 guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#406060 guifg=fg gui=none
        if version >= 700
            hi Visual ctermbg=7 ctermfg=0 guibg=#608080 gui=none
        else
            hi Visual ctermbg=7 ctermfg=0 guibg=#608080 guifg=fg gui=none
        endif
        hi VisualNOS guibg=bg guifg=#90b0b0 gui=bold,underline
    else
        if s:jukart_style == "dark"
            hi Normal ctermbg=0 ctermfg=7 guibg=#202020 guifg=#d0d0d0 gui=none

            hi CursorColumn guibg=#444444 gui=none
            hi CursorLine guibg=#444444 gui=none
        elseif s:jukart_style == "black"
            hi Normal ctermbg=0 ctermfg=7 guibg=#000000 guifg=#d0d0d0 gui=none

            hi CursorColumn guibg=#3a3a3a gui=none
            hi CursorLine guibg=#3a3a3a gui=none
        endif
        hi FoldColumn ctermbg=bg guibg=bg guifg=#a0b0c0 gui=none
        hi Folded guibg=#585858 guifg=#c0d0e0 gui=none
        hi LineNr term=bold cterm=NONE ctermfg=black ctermbg=yellow gui=NONE guifg=black guibg=lightyellow
        hi NonText ctermfg=8 guibg=bg guifg=#a0b0c0 gui=bold
        hi Pmenu guibg=#8090a0 guifg=#000000 gui=none
        hi PmenuSbar guibg=#607080 guifg=fg gui=none
        hi PmenuThumb guibg=#c0d0e0 guifg=bg gui=none
        hi SignColumn ctermbg=bg guibg=bg guifg=#a0b0c0 gui=none
        hi StatusLine ctermbg=7 ctermfg=0 guibg=#ff4500 guifg=white gui=bold
        hi StatusLineNC ctermbg=8 ctermfg=0 guibg=grey guifg=black gui=none
        hi TabLine guibg=#566676 guifg=fg gui=underline
        hi TabLineFill guibg=#566676 guifg=fg gui=underline
        hi VertSplit ctermbg=7 ctermfg=0 guibg=#ff4500 guifg=fg gui=none
        if version >= 700
            hi Visual ctermbg=7 ctermfg=0 guibg=#607080 gui=none
        else
            hi Visual ctermbg=7 ctermfg=0 guibg=#607080 guifg=fg gui=none
        endif
        hi VisualNOS guibg=bg guifg=#90a0b0 gui=bold,underline
    endif
    hi Cursor guibg=#ff4500 guifg=white gui=none
    hi CursorColumn guibg=#3a3a3a gui=none
    hi CursorLine guibg=#3a3a3a gui=none
    hi DiffAdd guibg=#008b00 guifg=fg gui=none
    hi DiffChange guibg=#00008b guifg=fg gui=none
    hi DiffDelete guibg=#8b0000 guifg=fg gui=none
    hi DiffText guibg=#0000cd guifg=fg gui=bold
    hi Directory guibg=bg guifg=#1e90ff gui=none
    hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
    hi IncSearch guibg=#e0cd78 guifg=#000000 gui=none
    hi ModeMsg guibg=bg guifg=fg gui=bold
    hi MoreMsg guibg=bg guifg=#7ec0ee gui=bold
    hi PmenuSel guibg=#e0e000 guifg=#000000 gui=none
    hi Question guibg=bg guifg=#e8b87e gui=bold
    hi Search guibg=#90e090 guifg=#000000 gui=none
    hi SpecialKey guibg=bg guifg=#e8b87e gui=none
    if has("spell")
        hi SpellBad guisp=#ee2c2c gui=undercurl
        hi SpellCap guisp=#2c2cee gui=undercurl
        hi SpellLocal guisp=#2ceeee gui=undercurl
        hi SpellRare guisp=#ee2cee gui=undercurl
    endif
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title ctermbg=0 ctermfg=15 guifg=fg gui=bold
    hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold
    hi WildMenu guibg=#e0e000 guifg=#000000 gui=bold

    hi Comment guibg=bg guifg=SkyBlue gui=none
    hi Constant guibg=bg guifg=#ffa0a0 gui=none
    hi Error guibg=lightgrey guifg=red gui=none
    hi Identifier guibg=bg guifg=palegreen gui=none
    hi Ignore guibg=bg guifg=bg gui=none
    hi lCursor guibg=#00e700 guifg=#000000 gui=none
    hi MatchParen guibg=#008b8b gui=none
    hi PreProc guibg=bg guifg=indianred gui=none
    hi Special guibg=bg guifg=#e8b87e gui=none
    hi Statement guibg=bg guifg=khaki gui=none
    hi Todo guibg=#e0e000 guifg=#000000 gui=none
    hi Type guibg=bg guifg=darkkhaki gui=none
    hi Underlined guibg=bg guifg=#00a0ff gui=underline    

    hi htmlBold ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold
    hi htmlItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=italic
    hi htmlUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline
    hi htmlBoldItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline,italic

elseif &background == "light"
    hi ClassName guibg=bg guifg=indianred gui=none
    hi DefinedName guibg=bg guifg=Yellow gui=none
    hi Enumerator guibg=bg guifg=Yellow gui=none
    hi Function guibg=bg guifg=LightGreen gui=none
    hi EnumerationName guibg=bg guifg=Yellow gui=none
    hi Member guibg=bg guifg=violet gui=none
    hi Union guibg=bg guifg=Red gui=none
    hi GlobalConstant guibg=bg guifg=Red gui=none
    hi GlobalVariable guibg=bg guifg=Red gui=none

    if s:jukart_style == "light"
        hi Normal ctermbg=15 ctermfg=0 guibg=#a0a0a0 guifg=#000000 gui=none
        hi CursorColumn guibg=#d4d4d4 gui=none
        hi CursorLine guibg=#d4d4d4 gui=none
    elseif s:jukart_style == "white"
        hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#000000 gui=none
        hi CursorColumn guibg=#dbdbdb gui=none
        hi CursorLine guibg=#dbdbdb gui=none
    endif
    hi Cursor guibg=#000000 guifg=bg gui=none
    hi DiffAdd guibg=#008b00 guifg=#ffffff gui=none
    hi DiffChange guibg=#00008b guifg=#ffffff gui=none
    hi DiffDelete guibg=#8b0000 guifg=#ffffff gui=none
    hi DiffText guibg=#0000cd guifg=#ffffff gui=bold
    hi Directory guibg=bg guifg=#0000f0 gui=none
    hi ErrorMsg guibg=#ee2c2c guifg=#ffffff gui=bold
    hi FoldColumn ctermbg=bg guibg=bg guifg=#506070 gui=none
    hi Folded guibg=#c5c5c5 guifg=#203040 gui=none
    hi IncSearch guibg=#ffcd78 gui=none
    hi LineNr term=bold cterm=NONE ctermfg=black ctermbg=yellow gui=NONE guifg=black guibg=lightyellow
    hi ModeMsg ctermbg=15 ctermfg=0 guibg=bg guifg=fg gui=bold
    hi MoreMsg guibg=bg guifg=#1f3f81 gui=bold
    hi NonText ctermfg=8 guibg=bg guifg=#506070 gui=bold
    hi Pmenu guibg=#8a9aaa guifg=#000000 gui=none
    hi PmenuSbar guibg=#708090 guifg=fg gui=none
    hi PmenuSel guibg=#ffff00 guifg=#000000 gui=none
    hi PmenuThumb guibg=#b0c0d0 guifg=fg gui=none
    hi Question guibg=bg guifg=#813f11 gui=bold
    hi Search guibg=#a0f0a0 gui=none
    hi SignColumn ctermbg=bg guibg=bg guifg=#506070 gui=none
    hi SpecialKey guibg=bg guifg=#912f11 gui=none
    if has("spell")
        hi SpellBad guisp=#ee2c2c gui=undercurl
        hi SpellCap guisp=#2c2cee gui=undercurl
        hi SpellLocal guisp=#008b8b gui=undercurl
        hi SpellRare guisp=#ee2cee gui=undercurl
    endif
    hi StatusLine ctermbg=7 ctermfg=0 guibg=#ff4500 guifg=white gui=bold
    hi StatusLineNC ctermbg=7 ctermfg=0 guibg=#b0c0d0 guifg=fg gui=none
    hi TabLine guibg=#b4c4d4 guifg=fg gui=underline
    hi TabLineFill guibg=#b4c4d4 guifg=fg gui=underline
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title guifg=fg gui=bold
    hi VertSplit ctermbg=7 ctermfg=0 guibg=#ff4500 guifg=fg gui=none
    if version >= 700
        hi Visual ctermbg=7 ctermfg=0 guibg=#c0d0e0 gui=none
    else
        hi Visual ctermbg=7 ctermfg=0 guibg=#c0d0e0 guifg=fg gui=none
    endif    
    hi VisualNOS guibg=bg guifg=#90a0b0 gui=bold,underline
    hi WarningMsg guibg=bg guifg=#ee2c2c gui=bold
    hi WildMenu guibg=#ffff00 guifg=fg gui=bold

    hi Comment guibg=bg guifg=#786000 gui=none
    hi Constant guibg=bg guifg=#077807 gui=none
    hi Error guibg=bg guifg=#ee2c2c gui=none
    hi Identifier guibg=bg guifg=#007080 gui=none
    hi Ignore guibg=bg guifg=bg gui=none
    hi lCursor guibg=#008000 guifg=#ffffff gui=none
    hi MatchParen guibg=#00ffff gui=none
    hi PreProc guibg=bg guifg=#800090 gui=none
    hi Special guibg=bg guifg=#912f11 gui=none
    hi Statement guibg=bg guifg=#1f3f81 gui=bold
    hi Todo guibg=#ffff00 guifg=fg gui=none
    hi Type guibg=bg guifg=#912f11 gui=bold
    hi Underlined guibg=bg guifg=#0000cd gui=underline

    hi htmlBold guibg=bg guifg=fg gui=bold
    hi htmlItalic guibg=bg guifg=fg gui=italic
    hi htmlUnderline guibg=bg guifg=fg gui=underline
    hi htmlBoldItalic guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlUnderlineItalic guibg=bg guifg=fg gui=underline,italic

endif
