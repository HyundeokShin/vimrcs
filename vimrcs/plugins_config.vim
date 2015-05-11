"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"  tst
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
"{{{
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()
"}}}
""""""""""""""""""""""""""""""
" =>easyalign
""""""""""""""""""""""""""""""
"{{{
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" =>supertab
""""""""""""""""""""""""""""""
"{{{
let g:SuperTabDefaultCompletionType = "<c-n>"
"}}}
""""""""""""""""""""""""""""""
" => markdown instant
""""""""""""""""""""""""""""""
"{{{
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
"}}}
""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
"{{{
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>
"}}}
""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
"{{{
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"}}}
""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
"{{{
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif

"}}}
""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
"{{{
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

"}}}
""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
"{{{
" Enable all functions in all modes
let g:user_zen_mode='a'

"}}}
""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
"{{{
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>
"}}}
""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
"{{{
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:multi_cursor_next_key="\<C-s>"


"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:airline_theme="luna"

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
"nnoremap <silent> <leader>z :Goyo<cr>


"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  instant_makrdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

let g:instant_markdown_autostart = 0
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
set shell=bash\ -i

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  vimlatex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"function! SetupLatex(arg)
"    if a:arg == 'pdf'
"        let a:targetformat = 'pdf'
"    elseif a:arg == 'dvi'
"        let a:targetformat = 'dvi'
"    elseif a:arg == ''
"        if g:Tex_DefaultTargetFormat == 'dvi'
"            let a:targetformat = 'pdf'
"        else
"            let a:targetformat = 'dvi'
"        endif
"    endif
 
"    if a:targetformat == 'dvi'
        " target for latex
"        let g:Tex_DefaultTargetFormat = 'dvi'
        " inverse search -- start gvim as "gvim --servername xdvi"
        "let g:Tex_CompileRule_dvi = 'latex --src -interaction nonstopmode $*'
        "let g:Tex_CompileRule_dvi = 'latex --src -interaction nonstopmode $*; if pgrep -fx "xdvi.bin -name xdvi -editor gvim --servername vim --remote +%l %f $*"; then wmctrl -a "xdvik:  $*"; fi;'
"        let g:Tex_CompileRule_dvi = 'latex --src -interaction nonstopmode $*; if pgrep "xdvi.bin"; then wmctrl -a "xdvik:"; fi;'
"        let g:Tex_ViewRule_dvi = 'xdvi -editor "gvim --servername vim --remote +\%l \%f" -watchfile 1 $* &'
"        map \ld :execute '!xdvi -editor "gvim --servername '.v:servername.' --remote +\%l \%f" -sourceposition '.line(".").':'.col(".").expand("%").' '.expand(Tex_GetMainFileName(':r')).'.dvi >/dev/null&'<CR><CR>
"    else " pdf
"        let g:Tex_DefaultTargetFormat = 'pdf'
"        let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode $*; if pgrep -fx "xpdf -remote vimlatex $*.pdf"; then xpdf -remote vimlatex -reload && wmctrl -a "Xpdf: $*.pdf"; fi;'
        "let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode $*; if pgrep -fx "xpdf -remote vimlatex $*.pdf"; then xpdf -remote vimlatex -reload -raise; fi;'
"        let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode $*; if pgrep -fx "xpdf -remote vimlatex $*.pdf"; then xpdf -remote vimlatex -reload && wmctrl -a "Xpdf: $*.pdf"; fi;'
"        let g:Tex_ViewRule_pdf = 'xpdf -remote vimlatex'
"    endif
"endfunction
 
"if exists("myTeXtarget")
"    :call SetupLatex(myTeXtarget)
"    let g:Tex_MultipleCompileFormats = 'dvi,pdf'
 
    " include cross referenced references also if they are cross referenced less
    " than two times
""    let g:Tex_BibtexFlavor = 'bibtex -min-crossrefs=1'
""    " let the cursor in the tex buffer if an error occured
"    let g:Tex_GotoError = 0
"    let g:Tex_IgnoredWarnings =
"                \'Underfull'."\n".
""                \'Overfull'."\n".
"                \'specifier changed to'."\n".
"                \'You have requested'."\n".
"                \'Missing number, treated as zero.'."\n".
""                \'There were undefined references'."\n".
"                \'Latex Warning:'."\n".
"                \'LaTeX Warning:' " float stuck
"                "\'Citation %.%# undefined'
"    let g:Tex_IgnoreLevel = 8
"    let g:Tex_FoldedEnvironments = 'frame,verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage'
"endif
 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf,aux,pdf'
let g:Tex_BibtexFlavor = 'bibtex'

"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats='pdf,bbl,pdf'
"let g:Tex_BibtexFlavor = 'biber'
"let g:Tex_CompileRule_pdf = 'arara -v $*'
"let g:Tex_CompileRule_bib = 'biber $*'

"let bibFileName = '.bcf'
"au BufWritePost *.tex silent call Tex_RunLaTeX()
"au BufWritePost *.tex silent !pkill -USR1 xdvi.bin
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on
"
""" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
"" can be called correctly.
set shellslash
""
""" IMPORTANT: grep will sometimes skip displaying the file name if you
""" search in a singe file. This will confuse Latex-Suite. Set your grep
""" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
""
""" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on
""
""" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
""" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
""" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
function CompileXeTex()
    let oldCompileRule=g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'pdflatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    call Tex_RunLaTeX()
    let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTex()<CR>
let g:Tex_UseMakefile = 0
"let g:Tex_CompileRule_pdf = "make"
"
"" this is mostly a matter of taste. but LaTeX looks good with just a bit
"" of indentation.
set sw=2
"" TIP: if you write your \label's as \label{fig:something}, then if you
"" type in \ref{fig: and press <C-n> you will automatically cycle through
"" all the figure labels. Very useful!
set iskeyword+=:
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-latex-live-preview 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Skim.app'
let g:Tex_ViewRule_pdf = 'open -a Skim.app'
let g:livepreview_previewer = 'open -a Skim.app'
"let g:livepreview_previewer = 'open -a /Applications/Preview.app'
"let g:livepreview_previewer = 'open -a Preview'
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:syntastic_python_checkers=['pyflakes']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



