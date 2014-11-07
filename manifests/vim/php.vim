if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

"""""""""""""""""""""""""
" phpqa plugin settings "
"""""""""""""""""""""""""


"phpmd config
let g:phpqa_messdetector_ruleset = "~/.vim/phpmd.xml"

" standard for plugin phpcs
let g:phpqa_codesniffer_args="--standard=PSR2"

" disable/enable phpqa
let g:phpqa_enable_by_me = 1
function! PhpqaEnableDisable()
    echohl Title
    if g:phpqa_enable_by_me
        let g:phpqa_messdetector_autorun = 0
        let g:phpqa_codesniffer_autorun = 0
        echo "Phpqa disable"
    else
        let g:phpqa_messdetector_autorun = 1
        let g:phpqa_codesniffer_autorun = 1
        echo "Phpqa enable"
    endif
    let g:phpqa_enable_by_me = 1 - g:phpqa_enable_by_me
    echohl None
endfunction

" map to disable/enable phpqa
nnoremap <leader>p :call PhpqaEnableDisable()<cr>

""""""""""""""""""
" phpunitqf      "
""""""""""""""""""

" run phpunit
function! RunPHPUnitTest(filter)
    let s:bootstrapfile = getcwd() . "/test/bootstrap.php"
    if a:filter
        normal! T yw
        let l:args = "--bootstrap " . s:bootstrapfile ." --filter " . @" . " " . bufname("%")
    else
        let l:args = "--bootstrap " . s:bootstrapfile ." " . bufname("%")
    endif
    Test(l:args)
endfunction

" maps to run phpunit
map <leader>u :Test --bootstrap test/bootstrap.php %<cr>
nnoremap <leader>f :call RunPHPUnitTestOld(0)<cr>
