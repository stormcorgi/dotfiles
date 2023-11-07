set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'osyo-manga/vim-over'
Plugin 'folke/tokyonight.nvim'

Plugin 'lambdalisue/fern.vim'
Plugin 'lambdalisue/fern-git-status.vim'
Plugin 'lambdalisue/nerdfont.vim'                " アイコン一般
Plugin 'lambdalisue/fern-renderer-nerdfont.vim'  " fernでアイコンを表示する
Plugin 'lambdalisue/glyph-palette.vim'           " アイコンに色をつける

Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

call vundle#end()
filetype plugin indent on
