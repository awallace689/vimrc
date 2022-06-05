"MINE
"
set background=dark
set t_Co=256

fun! CPPFormatSettings()
  setlocal equalprg=clang-format\ -style=google
endfun

autocmd FileType c,cpp call CPPFormatSettings()
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

"Ale stuff
let g:ale_disable_lsp = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

function CheckIfFileExists(filename)
  if filereadable(a:filename)
    return 1
  endif

  return 0
endfunction

"Plug
call plug#begin('~/.vim/plugged')

Plug 'elixir-editors/vim-elixir'
Plug 'Yggdroot/indentLine'
Plug 'bluz71/vim-moonfly-colors'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'cocopon/iceberg.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'cseelus/vim-colors-lucid'
Plug 'dense-analysis/ale'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'gkeep/iceberg-dark'
Plug 'itchyny/lightline.vim'
Plug 'jaredgorski/SpaceCamp'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'mkitt/tabline.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'sheerun/vim-polyglot'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
"BEGIN Rails - Don't forget to 'gem install gem-ctags'
" Source: https://chodounsky.com/2016/12/09/using-tags-to-browse-ruby-and-gem-source-with-vim/
"
" [ctags]
" Run:
"   gem install gem-ctags
"   gem ctags
"
"   mkdir -p ~/.rbenv/plugins
"   git clone git://github.com/tpope/rbenv-ctags.git \
"     ~/.rbenv/plugins/rbenv-ctags
"   rbenv ctags
" Run: [in vim] ':Rtags' to enable ctag navigation 'ctrl + ]'
" [END ctags]
"
" [view Rails source]
" 1. Set $EDITOR='vim'
" 2. exec 'bundle open rails' in project
" 3. [in vim] ':FZF ../' to search project gem installations
" [END view Rails source]
"
"
"Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rbenv'
"Plug 'tpope/vim-bundler'
"END Rails


call plug#end()
"END Plug 

"indentLine json settings (not native VIM)
autocmd Filetype json let g:indentLine_enabled = 0

"indentLine character (not native VIM)
let g:indentLine_char = '¦'

"FZF
nnoremap <silent> <leader>F :FZF ~/projects/elixir/getting-started/basics/<CR>

"set netrw tree view
let g:netrw_liststyle = 3

"js syntax highlighting
let g:vim_jsx_pretty_colorful_config = 1

"Enable markdown preview / grip
let vim_markdown_preview_github=1

"Set colorscheme
let g:gruvbox_italic=1
colorscheme moonfly

"Lightline extension theme
let g:lightline = { 'colorscheme': 'powerlineish'}

"emmet
let g:user_emmet_leader_key=','

"""""""""""""""""
""""BEGIN ALE""""
"""""""""""""""""


let g:ale_linters = {'cpp': ['clang'], 'c': ['clang'], 'ruby': ['rubocop'], 'elixir': ['elixir-ls'] }
"Elixir
let g:ale_fixers = {'elixir': ['mix_format']}
"END Elixir

let g:ale_elixir_elixir_ls_release = '/home/asdff01/projects/elixir/elixir-ls/'
"
" Disable GHC linter if in a Haskell Stack project
if (CheckIfFileExists("./stack.yaml") == 1)
  let g:ale_linters = {
  \   'haskell': ['stack-build'],
  \}
endif

let g:ale_linters_explicit = 0

"""""""""""""""
""""END ALE""""
"""""""""""""""

"""""""""""""""""""""""
""""BEGIN Gitgutter""""
"""""""""""""""""""""""

"set gitgutter sign column bg color to theme
autocmd ColorScheme * highlight! link SignColumn LineNr

"show gitgutter sign column
set signcolumn=yes

"gitgutter handles sign background color
let g:gitgutter_set_sign_backgrounds = 1

"update swap every 100ms (for gitgutter)
set updatetime=4000


"""""""""""""""""""""
""""END Gitgutter""""
"""""""""""""""""""""

"""""""""""""""""""""
""""""VIM CONFIG"""""
"""""""""""""""""""""
inoremap jj <ESC>

"disable all auto-newline in insert mode
set textwidth=0 wrapmargin=0

set foldlevel=0

"set relative line numbers
set relativenumber

"fold based on syntax
"  zc: close fold
"  zo: open fold
"  za: toggle fold
"  z<shift + <above>>:  recursive
"set foldmethod=syntax

"set horizontal line marker
set cursorline

"set case insensitive search
set ignorecase

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = \","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace (partially-overwritten)
set wrap
set shiftwidth=2
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

"terminal colors
set termguicolors

"python stuff
au FileType python setl shiftwidth=2 tabstop=2 softtabstop=2

"""""""""""""""""""""
""""END VIM CONFIG"""
"""""""""""""""""""""

"""""""""""""""""""""
""""""BEGIN COC""""""
"""""""""""""""""""""

"ElixirLS magic to set project root @ mix.exs parent folder
autocmd FileType elixir let b:coc_root_patterns = ['mix.exs']

"CoC language servers (not totally necessary)
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css'
  \ ]
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumviible() ? "\<C-p>" : "\<C-h>"

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
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""
""""""END COC""""""
"""""""""""""""""""

