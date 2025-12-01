" Clear search highlighting and escape
nnoremap ññ :nohlsearch<CR><Esc>
inoremap ññ <Esc>
vnoremap ññ <Esc>
tnoremap ññ <C-\><C-n>
cnoremap ññ <C-c>

nnoremap ñÑ :nohlsearch<CR><Esc>
inoremap ñÑ <Esc>
vnoremap ñÑ <Esc>
tnoremap ñÑ <C-\><C-n>
cnoremap ñÑ <C-c>

nnoremap Ññ :nohlsearch<CR><Esc>
inoremap Ññ <Esc>
vnoremap Ññ <Esc>
tnoremap Ññ <C-\><C-n>
cnoremap Ññ <C-c>

nnoremap ÑÑ :nohlsearch<CR><Esc>
inoremap ÑÑ <Esc>
vnoremap ÑÑ <Esc>
tnoremap ÑÑ <C-\><C-n>
cnoremap ÑÑ <C-c>

nnoremap gd <C-]>
nnoremap gb <C-T>

" Better up/down for wrapped lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')


" Half page up/down
nnoremap J <C-D>
nnoremap K <C-U>


" Better indenting
vnoremap > >gv
vnoremap < <gv
nnoremap > <<
nnoremap < >>

vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
nnoremap <S-Tab> <<
nnoremap <Tab> >>


" i3-like splits
nnoremap - <C-W>s
vnoremap - <C-W>s
"nnoremap | <C-W>v
"vnoremap | <C-W>v


" Move lines
nnoremap <Esc>j :m .+1<CR>==
nnoremap <Esc>k :m .-2<CR>==
inoremap <Esc>j <Esc>:m .+1<CR>==gi
inoremap <Esc>k <Esc>:m .-2<CR>==gi
vnoremap <Esc>j :m '>+1<CR>gv=gv
vnoremap <Esc>k :m '<-2<CR>gv=gv

" Add undo break-points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u
noremap H ^
noremap L $


" Enter key inserts newline
nnoremap <CR> i<CR><Esc>


" Classical Vimscript equivalent

set shortmess=astWAIcT
set cmdheight=3

" Line numbers
set number
set relativenumber

" Mouse support
set mouse=a

" Don't show mode (already in statusline)
set noshowmode

" Sync clipboard with OS
set clipboard=unnamedplus

" Enable break indent
set breakindent

" Save undo history (persistent undo)
if has('persistent_undo')
    set undofile
endif

" Case-insensitive search, unless capital letters used
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=250

" Decrease mapped sequence wait time
set timeoutlen=300

" Configure split behavior
set splitright
set splitbelow

" Display certain whitespace characters
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Show which line the cursor is on
set cursorline

" Minimal lines around cursor
set scrolloff=10

" Highlight search
set hlsearch

" Tabs and indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Undo levels
set undolevels=10000

" Allow cursor to move freely in visual block mode
set virtualedit=block

" Command-line completion mode
set wildmode=longest:full,full

" VISUAL MULTI
let g:VM_default_mappings           = 0
let g:VM_maps                       = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Select Cursor Down"] = '<C-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>'
let g:VM_maps["Exit"]               = 'ññ'        " start selecting up cool stuff basically

set nocursorline

let &t_SI = "\e[6 q"   " Insert mode: line cursor
let &t_EI = "\e[2 q"   " Normal/Visual mode: block cursor
let &t_SR = "\e[4 q"   " Replace mode: underline cursor (optional)

set completeopt=menu,menuone,noselect
set shortmess+=c
set complete=.,w,b,u,t

" Helper function: check if character before cursor is a letter
function! s:ShouldComplete() abort
  let col = col('.') - 1
  if col <= 0
    return 0
  endif
  let char = getline('.')[col - 1]
  return char =~ '\a'   " \a matches [A-Za-z]
endfunction

" Use Tab / Shift-Tab to navigate completion menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : ( <SID>ShouldComplete() ? "\<C-x><C-n>" : "\<Tab>" )
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

set nobackup
set nowritebackup

set backupdir=~/.vim/junk//
set undodir=~/.vim/junk//

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
Plug 'svermeulen/vim-cutlass'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Bind Space + e to toggle Netrw
nnoremap <silent> <Space>e :call ToggleNetrw()<CR>
