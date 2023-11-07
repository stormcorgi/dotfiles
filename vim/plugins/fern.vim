nnoremap <C-g> :<C-u>Fern . -drawer -width=40 -toggle -reveal=%<CR>

let g:fern#disable_default_mappings = 1
if get(g:, 'rich')
  let g:fern#renderer = 'nerdfont'
endif

function! s:init_fern() abort
  setlocal nonumber
  setlocal nocursorcolumn
  nmap <buffer><silent><expr>
    \ <Plug>(fern-my-open-or-expand-collapse)
    \ fern#smart#leaf(
    \   "\<Plug>(fern-action-open)",
    \   "\<Plug>(fern-action-expand)",
    \   "\<Plug>(fern-action-collapse)",
    \ )
  nmap <buffer> o <Plug>(fern-my-open-or-expand-collapse)
  nmap <buffer> <C-m> <Plug>(fern-action-open)<C-w>p:<C-u>quit<CR>
  nmap <buffer> x <Plug>(fern-action-collapse)
  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> X <Plug>(fern-action-open:system)
  nmap <buffer> R <Plug>(fern-action-reload)

  nmap <buffer> A <Plug>(fern-action-new-path=)
  nmap <buffer> m <Plug>(fern-action-mark)j
  nmap <buffer> M <Plug>(fern-action-rename:bottom)
  nmap <buffer> D <Plug>(fern-action-trash=)

  nmap <buffer> q :<C-u>quit<CR>
endfunction

augroup fern-custom
  au! *
  au FileType fern call s:init_fern()
augroup END
