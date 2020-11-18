# scoop install
if (!(Get-Command "scoop.ps1")) {
    Write-Output "scoop(windows package manager) isn't installed. so install it."
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
    Write-Output "scoop install : done!"
} else {
    Write-Output "scoop is already installed."
}

# scoop periferals
scoop update
scoop install 7zip busybox conemu dark dig innounp peco putty pwsh


# peco install
if (!(Get-Command "peco.exe")) {
    Write-Output "peco isn't installed. so install it."
    scoop install peco
    Write-Output "peco install : done!"
} else {
    Write-Output "peco is already installed."
}

# pwsh(powershell core) installed?
if (!(Get-Command "pwsh.exe")) {
    scoop install pwsh
    Write-Output "you must use pwsh. call this ps1 file with pwsh."
    Write-Output "> pwsh ./setup.ps1"
    exit
}

# posh-git and oh-my-posh install
$addlines = @"
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Powerline
"@

if (! ((Get-Module -ListAvailable -Name posh-git) -and (Get-Module -ListAvailable -Name oh-my-posh)) ) {
    Install-Module posh-git -Scope CurrentUser
    Install-Module oh-my-posh -Scope CurrentUser
    if ($PSVersionTable.PSVersion.Major -gt 6) {
        Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
    }

    Write-Output "add those lines in $profile."
    Write-Output $(Get-Content $addlines)

    Import-Module posh-git
    Import-Module oh-my-posh
    Set-Theme Powerline
} else {
    Write-Output "posh-git and oh-my-posh is already installed."
}

# vim check (not install)
if (Get-Command "vim.exe" -ErrorAction SilentlyContinue) {
    # vim dotfiles cp
    Copy-Item ~/dotfiles/vim/vimrc ~/_vimrc
    Copy-Item ~/dotfiles/vim/gvimrc ~/_gvimrc
    # create vim undo / swp / backup target dirctory
    if (!(Test-Path ~/.vim/undo)) {
        mkdir ~/.vim/undo
    }
    # Vundle install
    if (!(Test-Path ~/.vim/bundle/Vundle.vim)) {
        Write-Output "~/.vim/bundle/Vundle.vim not fonud. installing..."
        mkdir ~/.vim/bundle
        Write-Output "git clone..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
    }
    Write-Output "vim initialize : done!"
} else {
    Write-Output "vim is not installed. so initialization skipped. (require kaoriya-vim x86)"
}

