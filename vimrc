" Pathogen
execute pathogen#infect()

" colorscheme solarized
" set background=dark
syntax enable
"colorscheme monokai
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-monokai
set background=dark


set number
set tabstop=4
set softtabstop=4
set expandtab

set wildmenu

set showmatch

set incsearch
set hlsearch

let g:airline_powerline_fonts = 1

set guioptions-=L
set guioptions-=r 


"### From http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright


"### http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2403926#2403926 
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" http://amix.dk/blog/post/19403
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

map <C-O> :NERDTreeToggle ~/<CR>

function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count 
endfunction
set statusline=wc:%{WordCount()}
