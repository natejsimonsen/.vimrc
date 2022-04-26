call plug#begin()
" ============================================
"             Functional Plugins
" ============================================
Plug 'tpope/vim-repeat' " a plugin to make plugin commands repeat with .
Plug 'tpope/vim-surround' " a plugin to change, add, and remove surrounding characters
Plug 'mattn/emmet-vim' " html and jsx shorthand, example div>li.list*4 <C-y>,
Plug 'preservim/nerdtree' " Plugin to make moving around the filesystem easier
Plug 'luochen1990/rainbow' " Changes the color of nested parenthesis, brackes, commas, and other things
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" ============================================
"                Coc Plugin
" ============================================
"       Coc adds language servers for vim
"  Essential plugins for development include, 
"       coc-css, coc-json, and coc-html
"   To install, run :CocInstall pluginName
" ============================================
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion tool

" ============================================
"       Nonessential 'Pretty' Plugins
" ============================================
Plug 'maxmellon/vim-jsx-pretty' " jsx syntax hightlighting
Plug 'yuezk/vim-js' " syntzx hightlighting for javascript
Plug 'itchyny/lightline.vim' " Displays a nice bar that displays what insert mode im in
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
call plug#end()

" ============================================
"             General Settings
" ============================================
syntax on
colorscheme gruvbox
" colorscheme gruvbox
set shiftwidth=2 " the > command is equal to two spacs
set background=dark
set laststatus=2 " sets the status line for vim needs to be here for lightline to work
set incsearch
set hlsearch " shows results of search as its type
set expandtab " converts tabs to spaces
set autoindent " indents to current position
set fileformat=unix " sets the file format
set encoding=utf-8 "sets the encoding
set number relativenumber "sets the line number and relativenumber shows the number of the lines relative to the current position
set splitbelow splitright " set the splitwindow to be right when the split window is opened

"sets colors of javascript and jsx files
autocmd BufNewFile,BufRead *.js,*.jsx hi Function guifg=#d65d0e
autocmd BufNewFile,BufRead *.js,*.jsx hi String guifg=#8ec07c
autocmd BufNewFile,BufRead *.js,*.jsx hi Type guifg=#458588

" ============================================
"              Vim Key Mappings
" ============================================
" replace all
nnoremap S : %s//g<Left><Left>
" beggining of line
nnoremap B ^
" end of line
nnoremap E $
" escape 
inoremap jk <esc>
map <space>p "+p
nmap <space>y "+yy
vmap <space>y "+y
nmap <space>g :NERDTreeToggle<CR>
" easier commands to navigate a split screen
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" ============================================
"              Plugin Settings
" ============================================
" coc settings
set formatoptions-=cro
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" use tab for trigger completion with characters ahead and navigate.
" note: use command ':Verbose imap <tab>' to make sure tab is not mapped by
" Other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" End of coc settings

let g:gruvbox_contrast_dark='hard' " color scheme contrast
let g:vim_jsx_pretty_enable_jsx_highlight=1
let g:user_emmet_leader_key="<C-y>" " sets the key for emmet to a space instead of <C-y>
let g:rainbow_active=1 " allows vim rainbow to be loaded on start

" sets color scheme of the lightline plugin
let g:lightline = {
  \'colorscheme': 'gruvbox',
\}

" emmet setting so classes work in jsx
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
  \  },
\}
