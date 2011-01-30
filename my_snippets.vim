" Templates: {{{1
" to add templates for new file type, see below
"
" "some new file type
" let g:template['newft'] = {}
" let g:template['newft']['keyword'] = "some abbrevation"
" let g:template['newft']['anotherkeyword'] = "another abbrevation"
" ...
"
"let g:template['_']['test'] = "this is a test"

let g:template['python'] = {}
let g:template['python']['from'] = "from ".g:rs."...".g:re." import ".g:rs."...".g:re."\<cr>"

