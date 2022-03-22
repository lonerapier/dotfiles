" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

colorscheme dracula
let g:dracula_colorterm = 0
let g:dracula_italic = 1

"Config Section

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" Make sure we dont' load the rust cargo plugin from rust.vim!
let g:loaded_rust_vim_plugin_cargo = 1
" Don't add errors to quickfix if rustfmt fails.
let g:rustfmt_fail_silently = 1

" coc.vim
function! SetupCoc()
  nmap <silent> gd           <Plug>(coc-definition)
  nmap <silent> gy           <Plug>(coc-type-definition)
  nmap <silent> gi           <Plug>(coc-implementation)
  nmap <silent> gr           <Plug>(coc-references)
  nmap <silent> gj           <Plug>(coc-diagnostic-next)
  nmap <silent> gk           <Plug>(coc-diagnostic-prev)
  nmap <silent> <leader>/    :CocList --interactive symbols<CR>
  nmap <silent> <leader>r    <Plug>(coc-rename)

  " This is a kind of hack to make <C-Y> not trigger snippet expansion.
  " We use <C-p><C-n> to insert the selection without triggering anything, and
  " then close the popup.
  inoremap <silent><expr> <C-Y> pumvisible() ? "<C-p><C-n><Esc>a" : "\<C-Y>"
  " Trigger completion on <CR>.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endfunction
  autocmd User CocNvimInit call SetupCoc()
autocmd VimEnter * NERDTree | wincmd p