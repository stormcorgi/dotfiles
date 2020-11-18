Set-Location ~

# Tips
function myman {
    Write-Output "commands : pybozu, punch, sakura, sudo, hosts, myman"
    Write-Output "peco : pcd(peco-cd), psl(peco-select), open "
    Write-Output "don : post tl fav (all commands exec via altair)"
}
myman

Set-Alias sakura ("C:\Program Files (x86)\sakura\sakura.exe")
Set-Alias open invoke-item

if ($PSVersionTable.PSVersion.Major -eq 7) {
    & Import-Module posh-git
    & Import-Module oh-my-posh
    Set-Theme Powerline
    Set-Item env:LANG -Value ja_JP.UTF-8
}

function pcd($path) {
    $origin = [System.Console]::OutputEncoding
    $utf8 = [System.Text.Encoding]::GetEncoding("utf-8")
    $OutputEncoding = $utf8
    [System.Console]::OutputEncoding = $utf8
    $target = Get-ChildItem -Directory -Name -Depth 3 $path | peco
    [System.Console]::OutputEncoding = $origin
    Write-Output $($path + $target)
    Set-Location $($path + $target)
}

function psl {
    $origin = [System.Console]::OutputEncoding
    $utf8 = [System.Text.Encoding]::GetEncoding("utf-8")
    $OutputEncoding = $utf8
    [System.Console]::OutputEncoding = $utf8
    $out = Get-ChildItem -File -Name -Depth 4 | peco
    [System.Console]::OutputEncoding = $origin
    return $out
}


function hosts { Start-Process notepad C:\Windows\System32\drivers\etc\hosts -Verb runas }

function post($text) {
    ssh altair /home/motcha/.local/bin/toot post $text
}

function tl() {
    ssh altair /home/motcha/.local/bin/toot timeline -r -1
}

function fav() {
    $origin = [System.Console]::OutputEncoding
    $utf8 = [System.Text.Encoding]::GetEncoding("utf-8")
    $OutputEncoding = $utf8
    [System.Console]::OutputEncoding = $utf8
    $text = ssh altair /home/motcha/.local/bin/toot notifications
    Write-Output $text | less
    [System.Console]::OutputEncoding = $origin
}

