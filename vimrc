set relativenumber
set background=light

call plug#begin()
	Plug 'tpope/vim-sensible'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

" start the mvn build in a tmux pane with debug flag an the current buffer as filter parameter
" [vimux](https://github.com/benmills/vimux) is a plugin for tmux user to interact better between tmux and vim
" I just use it to kick of my maven build in debugmode with the actual Testclass
noremap <leader>ds :VimuxRunCommand "mvn -Dmaven.surefire.debug  -Dtest=".expand("%:t:r")." test --offline"<CR>

" runs mvn test with the current buffer name a filter parameter.
noremap <leader>rs :call RunMvnThisTest(expand("%:t:r"))<CR>

" runs all tests, but catch the output and open a new buffer with the result of the mvn build
noremap <leader>rS :call RunMvnTest()<CR>
map <leader>at :CocCommand java.debug.vimspector.start<CR>

let g:airline_theme='atomic'
