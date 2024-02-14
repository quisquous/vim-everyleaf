" TODO: maybe limit this to [0-9]*.info?
au BufNewFile,BufRead *.info set filetype=everyleaf
au BufNewFile,BufRead *.info setlocal suffixesadd+=.info
au BufNewFile,BufRead *.info setlocal foldmethod=syntax
au BufNewFile,BufRead *.info setlocal foldlevel=99
