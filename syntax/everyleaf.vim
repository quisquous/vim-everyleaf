" everyleaf info syntax file

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'everyleaf'
endif

syn keyword leafFood Breakfast Lunch Dinner Booze Coffee Tea Dessert contained
syn keyword leafMisc Mood Sick Tears Yoga Ring Drug contained
syn match leafMedia "Board Game" contained
syn keyword leafMedia Game TV Book Movie Podcast contained

syn match leafEntryHeader /^[^:]*:\s*/ contains=leafFood,leafMisc,leafMedia transparent nextgroup=leafEntry

syn match leafEntry /[^\(\[\{]*/ nextgroup=leafExtra contained
syn match leafExtra /.*$/ contained contains=leafParens,leafUrl,LeafJson

syn match leafParens /([^)]*)/ contained
syn match leafUrl /\[[^\]]*\]/ contained
syn match leafJson /{[^}]*}/ contained

syn match leafDate /[0-9]\{8\}/

syn match leafSectionHeader /^--[^-]\+--/
syn region leafSection start=/^--[^-]\+--/ end=/^--/me=e-2 fold contains=leafDate,leafSectionHeader transparent

hi def link leafSectionHeader Identifier
hi def link leafFood Statement
hi def link leafMisc Statement
hi def link leafGame Statement
hi def link leafMedia Statement
hi def link leafDate Underlined
hi def link leafParens Comment
hi def link leafUrl Underlined
hi def link leafJson String

let b:current_syntax = "everyleaf"
if main_syntax == "everyleaf"
  unlet main_syntax
endif
