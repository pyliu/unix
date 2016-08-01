set encoding=utf-8
set fileencodings=utf-8

colorscheme torte
syntax on
set nu
set nocompatible
set ai
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=2
set ic
set ru
set confirm
set foldmethod=syntax
set foldlevelstart=1
"set mouse=a

" Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" For NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" For minibuf
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
"================================
"<F1> 切换至前一个缓冲区
"<F2> 切换至后一个缓冲区
"<F3> 保存缓冲区
"<F4> 关闭缓冲区
"================================
nnoremap <F1> :call MyCyclebuffer(0)<CR>
nnoremap <Leader>1 :call MyCyclebuffer(0)<CR>
inoremap <F1> <ESC> :call MyCyclebuffer(0)<CR>
nnoremap <F2> :call MyCyclebuffer(1)<CR>
nnoremap <Leader>2 :call MyCyclebuffer(1)<CR>
inoremap <F2> <ESC> :call MyCyclebuffer(1)<CR>

"Cycle Through buffers
"from MiniBufExplorers
function! MyCyclebuffer(forward)
    "change buffer(keeping track of before and after buffers)
    let l:origBuf = bufnr("%")
    if(a:forward == 1)
        bn!
    else
        bp!
    endif
    let l:curBuf = bufnr("%")
    while getbufvar(l:curBuf, "&modifiable")==0 && l:origBuf!=l:curBuf
        if(a:forward == 1)
            bn!
        else
            bp!
        endif
        let 1:curBuf = bufnr("%")
    endwhile
endfunction

"<F3> or Ctrl-S update buffer
nnoremap <C-S> :update<CR>
inoremap <C-S> <C-O> :update<CR>
vnoremap <C-S> <C-C> :update<CR>
nnoremap <F3> :update<CR>
inoremap <F3> <C-O> :update<CR>

"<F4> close buffer
nnoremap <F4> :bd<CR>
nnoremap <Leader>4 :bd<CR>
inoremap <F4> <ESC> :bd<CR>

"=========================
"F5 在新窗口中打开对应的头文件或源文件
"F10 取消高亮显示查找结果
"==========================
map<F5> :AS<CR>
map<F10> :nohlsearch<CR>

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

command! PrettyJS call Jsbeautify()

"=========================
" Highlighting the current line & column
"=========================
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn
function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
"
nnoremap <silent> <leader>fx :call DoPrettyXML()<cr>

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 
