set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

autocmd FileType rust setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

set showmatch
set number
set smarttab
set breakindent
set cursorline
set nofoldenable
set autoindent
set splitright
set splitbelow
set relativenumber
set mouse=a

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
filetype plugin indent on

call plug#begin()
Plug 'thaerkh/vim-workspace'
"Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'justinmk/vim-dirvish'
Plug 'Yggdroot/indentLine'

"Navigation
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
"
"Language tools
"Plug 'ycm-core/YouCompleteMe'
"Plug 'w0rp/ale'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neoinclude.vim'
"Plug 'Shougo/echodoc.vim'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"C/CPP
"Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'mesonbuild/meson', { 'rtp': 'syntax-highlighting/vim'}
"Plug 'arrufat/vala.vim'

"Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neco-syntax', { 'for': 'vim' }

"JS
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'jparise/vim-graphql'

"Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
"Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
"
"Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
call plug#end()

set background=dark
set termguicolors
colorscheme base16-solarflare
let g:airline_theme='base16'
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

"vim-workspace
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0

"LanguageClient-neovim
"let g:LanguageClient_serverCommands = {
"    \ 'cpp': ['clangd'],
"    \ 'c': ['clangd'],
"    \ }
"    \ 'elixir': ['~/.config/nvim/elixir-ls/language_server.sh'],
"    \ 'cpp': ['ccls', '--log-file=/tmp/cq.log'],
"    \ 'c': ['ccls', '--log-file=/tmp/cq.log'],
"\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"
"let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
"let g:LanguageClient_settingsPath = '/home/bblaszkow/.config/nvim/settings.json'
"set completefunc=LanguageClient#complete
"set formatexpr=LanguageClient_textDocument_rangeFormatting()

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"
"Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete##enable_at_startup = 1
"call deoplete#custom#option('on_insert_enter', v:false)
"
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"let g:deoplete#max_menu_width = 20
"set completeopt+=preview

"inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"
"inoremap <expr><C-g> deoplete#undo_completion()
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <silent><expr> <Tab> pumvisible() ? deoplete#close_popup() : "\<Tab>"

"Neocomplete
"let g:neoinclude#paths = {}
"let g:neoinclude#paths.c = '/usr/lib/erlang/usr/include'
"let g:neoinclude#paths.cpp = '/usr/lib/erlang/usr/include'
"let g:deoplete#sources#clang#flags = ['-I/usr/lib/erlang/usr/include']

"YouCompleteMe
"let g:ycm_key_list_stop_completion = ['<C-y>']
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']

"NERDTree
"nnoremap <C-\> :NERDTreeToggle<CR>

"FZF
nnoremap <C-p> :FZF<CR>

"ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"ALE
let g:airline#extensions#ale#enabled = 1
"let g:ale_c_parse_compile_commands = 1
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

"EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <Leader>f <Plug>(easymotion-f)
nmap <Leader>F <Plug>(easymotion-F)
nmap <Leader>t <Plug>(easymotion-t)
nmap <Leader>T <Plug>(easymotion-T)
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>W <Plug>(easymotion-W)
nmap <Leader>b <Plug>(easymotion-b)
nmap <Leader>B <Plug>(easymotion-B)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"jsx
let g:jsx_ext_required = 0

"Racer
"set hidden
"let g:racer_cmd = "racer"
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap <leader>gd <Plug>(rust-doc)

"CoC
set hidden
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
