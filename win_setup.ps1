# scoop install
if (!(get-command "scoop.ps1")) {
    echo "scoop(windows package manager) isn't installed. so install it."
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
    echo "scoop install : done!"
} else {
    echo "scoop is already installed."
}

# scoop periferals
scoop update
scoop install 7zip busybox conemu dark dig innounp peco putty pwsh


# peco install
if (!(get-command "peco.exe")) {
    echo "peco isn't installed. so install it."
    scoop install peco
    echo "peco install : done!"
} else {
    echo "peco is already installed."
}

# pwsh(powershell core) installed?
if (!(get-command "pwsh.exe")) {
    scoop install pwsh
    echo "you must use pwsh. call this ps1 file with pwsh."
    echo "> pwsh ./setup.ps1"
    exit
}

# posh-git and oh-my-posh install
$addlines = @"
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Powerline
"@

if (! ((get-module -ListAvailable -name posh-git) -and (get-module -ListAvailable -Name oh-my-posh)) ) {
    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    if ($PSVersionTable.PSVersion.Major -gt 6) {
        Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
    }

    echo "add those lines in $profile."
    echo $(cat $addlines)

    Import-Module posh-git
    Import-Module oh-my-posh
    Set-Theme Powerline
} else {
    echo "posh-git and oh-my-posh is already installed."
}

# vim check (not install)
if (get-command "vim.exe" -ErrorAction SilentlyContinue) {
    # vim dotfiles cp
    cp ~/dotfiles/vim/vimrc ~/_vimrc
    cp ~/dotfiles/vim/gvimrc ~/_gvimrc
    # create vim undo / swp / backup target dirctory
    if (!(test-path ~/.vim/undo)) {
        mkdir ~/.vim/undo
    }
    # Vundle install
    if (!(test-path ~/.vim/bundle/Vundle.vim)) {
        echo "~/.vim/bundle/Vundle.vim not fonud. installing..."
        mkdir ~/.vim/bundle
        echo "git clone..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
    }
    echo "vim initialize : done!"
} else {
    echo "vim is not installed. so initialization skipped. (require kaoriya-vim x86)"
}

