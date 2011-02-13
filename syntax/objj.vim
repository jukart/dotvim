
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the objective-c syntax to start with
if version < 600
  source <sfile>:p:h/javascript.vim
else
  runtime! syntax/javascript.vim
endif

" Objective J extentions follow below
"
" NOTE: Objective J is abbreviated to ObjJ/objj
" and uses *.j as file extensions!


" ObjJ keywords, types, type qualifiers etc.
syn keyword objjStatement	self super _cmd
syn keyword objjType		id Class SEL IMP BOOL
syn keyword objjTypeModifier	bycopy in out inout oneway
syn keyword objjConstant	nil Nil

" Match the ObjJ #import directive (like C's #include)
syn region objjImported display contained start=+"+  skip=+\\\\\|\\"+  end=+"+
syn match  objjImported display contained "<[-_0-9a-zA-Z.\/]*>"
syn match  objjImport display "^\s*\(%:\|#\)\s*import\>\s*["<]" contains=objjImported

" Match the important ObjJ directives
syn match  objjScopeDecl    "@public\|@private\|@protected"
syn match  objjDirective    "@interface\|@implementation"
syn match  objjDirective    "@class\|@end\|@defs"
syn match  objjDirective    "@encode\|@protocol\|@selector"
syn match  objjDirective    "@try\|@catch\|@finally\|@throw\|@synchronized"

" Match the ObjJ method types
"
" NOTE: here I match only the indicators, this looks
" much nicer and reduces cluttering color highlightings.
" However, if you prefer full method declaration matching
" append .* at the end of the next two patterns!
"
syn match objjInstMethod    "^\s*-\s*"
syn match objjFactMethod    "^\s*+\s*"

" To distinguish from a header inclusion from a protocol list.
syn match objjProtocol display "<[_a-zA-Z][_a-zA-Z0-9]*>" contains=objjType,cType,Type


" To distinguish labels from the keyword for a method's parameter.
syn region objjKeyForMethodParam display
    \ start="^\s*[_a-zA-Z][_a-zA-Z0-9]*\s*:\s*("
    \ end=")\s*[_a-zA-Z][_a-zA-Z0-9]*"
    \ contains=objjType,objjTypeModifier,cType,cStructure,cStorageClass,Type

" Objective-C Constant Strings
syn match objjSpecial display "%@" contained
syn region objjString start=+\(@"\|"\)+ skip=+\\\\\|\\"+ end=+"+ contains=cFormat,cSpecial,objjSpecial

" Objective-C Message Expressions
syn region objjMessage display start="\[" end="\]" contains=objjMessage,objjStatement,objjType,objjTypeModifier,objjString,objjConstant,objjDirective,cType,cStructure,cStorageClass,cString,cCharacter,cSpecialCharacter,cNumbers,cConstant,cOperator,cComment,cCommentL,Type

syn cluster cParenGroup add=objjMessage
syn cluster cPreProcGroup add=objjMessage

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_objj_syntax_inits")
  if version < 508
    let did_objj_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink objjImport		Include
  HiLink objjImported		cString
  HiLink objjTypeModifier	objjType
  HiLink objjType		Type
  HiLink objjScopeDecl		Statement
  HiLink objjInstMethod		Function
  HiLink objjFactMethod		Function
  HiLink objjStatement		Statement
  HiLink objjDirective		Statement
  HiLink objjKeyForMethodParam	None
  HiLink objjString		cString
  HiLink objjSpecial		Special
  HiLink objjProtocol		None
  HiLink objjConstant		cConstant

  delcommand HiLink
endif

let b:current_syntax = "objj"

" vim: ts=8

