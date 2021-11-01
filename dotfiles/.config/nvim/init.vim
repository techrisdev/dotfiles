" Enable syntax highlighting
syntax on
set relativenumber

" Indentation
set autoindent
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8

" Change the directory automatically
set autochdir

" Mouse settings for tmux (scrolling)
set mouse=a

" Ignore case when searching
set ignorecase

language en_US.UTF-8

" Use the macOS Clipboard (on macOS)
set clipboard=unnamed

" Install plugins
call plug#begin('~/.vim/plugged')

" Install telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" LSP support
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" Nerdtree
Plug 'preservim/nerdtree'

" Rust support
"Plug 'rust-lang/rust.vim'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Better statusbar
"Plug 'itchyny/lightline.vim'

" Godot
Plug 'habamax/vim-godot'
call plug#end()

" Theme
colorscheme dracula

hi Normal guibg=NONE ctermbg=NONE

" Keybindings
" Set the leader key to space
let mapleader = " "

inoremap { {<CR>}<Esc>ko
inoremap [ []<ESC>i
inoremap ( ()<ESC>i

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').file_browser()<cr>

lua << EOF
require('telescope').setup {
	defaults = { file_ignore_patterns = {"node_modules", ".cache", ".mozbuild"} },  
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF

" Delete with d and cut with leader+d
nnoremap d "_d
vnoremap d "_d
nnoremap <leader>d d
vnoremap <leader>d d
nnoremap D "_D
vnoremap D "_D
nnoremap <leader>D D
vnoremap <leader>D D
" Same for deleting characters
nnoremap x "_x
vnoremap x "_x
nnoremap <leader>x x
vnoremap <leader>x x

" LSP
lua << EOF
require'lspconfig'.sourcekit.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
--require'lspconfig'.rls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.dartls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach, cmd={"clangd-mp-11", "--background-index"}}
--require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach, cmd={"ccls-clang-11"}}
require'lspconfig'.gdscript.setup{on_attach=require'completion'.on_attach}
EOF

" Rust
filetype plugin indent on

" Use <leader-r> to run files
" TODO: Maybe run every file with *.py instead of the current file
command PythonRun !python %
command CRun !cargo run
function Run()
	if &modified
		write
	endif
	if &filetype == 'python' 
		PythonRun 
	elseif &filetype == 'rust' 
		CRun 
	elseif &filetype == 'dart' 
		silent !dart format $PWD/%
		e
		if exists('g:flutter_job')
			FlutterHotRestart
		else
			FlutterRun
			" -d web-server --web-port=9999 --web-enable-expression-evaluation
		endif
	endif
endfunction
nnoremap <leader>r :call Run()<CR>

" Flutter and Dart
" Use <leader-q> to run 'dart format lib'
nnoremap <leader>q :!dart format lib<CR><ESC>

" Format code on save
"autocmd BufWritePost * if &filetype == 'dart' | call Run() | endif

" Use <leader-y> to run a python script
nnoremap <leader>y :!python main.py<CR><ESC>

" Reformat Code with leader+p
"nnoremap <leader>p :if &filetype == "rust" | echo "hello" | elseif &filetype == "dart" | DartFmt | endif<CR>

" Use <leader>o to insert a new line without going into insert mode
nnoremap <leader>o o<ESC>k

" Use <leader>p to insert a new line and paste
nnoremap <leader>p o<ESC>p

" Show NERDTree on <C-n>
nnoremap <C-n> :NERDTreeToggle<CR>

" Autocompletion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_trigger_character = ['.', '::']
let g:completion_trigger_on_delete = 1
let g:completion_matching_ignore_case = 1
let g:completion_matching_strategy_list = ["fuzzy", "substring"]
let g:completion_enable_snippet = "vim-vsnip"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Stop inserting comments automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable the status bar
set noshowmode
set noruler
set laststatus=0
set noshowcmd
