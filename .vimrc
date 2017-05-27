set nocompatible hidden ttyfast
set rnu nu
set ruler cursorline
set colorcolumn=76
set tw=76
set updatecount=0

" Disable folding
set nofoldenable

filetype plugin indent on
syntax enable

set omnifunc=syntaxcomplete#Complete

source ~/.vim/plugged/plugs.vim

for fpath in split(globpath('~/.vim/config', '*.vim'), '\n')
	exe 'source' fpath
endfor

nnoremap <F12> <C-]>

" Ligatures
if has("gui_macvim")
	"set guifont=Source\ Code\ Pro:h12
	"set guifont=Fira\ Code:h12
	set guifont=Go\ Mono:h12
	set macligatures
endif

set wildignore+=*/tmp/*,*.so,*.sw[a-z],*.zip,*.tar.gz,*.tar.bz2

let mapleader = ","
let maplocalleader = ";"

au FileType json set et sw=2 ts=2
au FileType javascript set et sw=2 ts=2

" go-vim
au FileType go nmap <leader>br <Plug>(go-run)
au FileType go nmap <leader>bb <Plug>(go-build)

au FileType go nmap <leader>r <Plug>(go-rename)

au FileType go nmap <leader>gg <Plug>(go-def)
au FileType go nmap <leader>gi <Plug>(go-implements)

au FileType go nmap <leader>dd <Plug>(go-doc)
au FileType go nmap <leader>di <Plug>(go-info)
au FileType go nmap <leader>dp <Plug>(go-deps)
au FileType go nmap <leader>db <Plug>(go-describe)
