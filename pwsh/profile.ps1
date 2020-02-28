cd ~

# Tips
function myman {
    echo "commands : pybozu, punch, sakura, sudo, hosts, myman"
    echo "peco : pcd(peco-cd), psl(peco-select), open "
    echo "don : post tl fav (all commands exec via altair)"
}
myman

set-alias sakura ("C:\Program Files (x86)\sakura\sakura.exe")
set-alias open invoke-item

if ($PSVersionTable.PSVersion.Major -eq 7){
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
    $target = get-childitem -Directory -name -depth 3 $path | peco
    [System.Console]::OutputEncoding = $origin
    echo $($path + $target)
    cd $($path + $target)
}

function psl {
    $origin = [System.Console]::OutputEncoding
    $utf8 = [System.Text.Encoding]::GetEncoding("utf-8")
    $OutputEncoding = $utf8
    [System.Console]::OutputEncoding = $utf8
    $out = get-childitem -file -name -depth 4 | peco
    [System.Console]::OutputEncoding = $origin
    return $out
}


function hosts {start notepad C:\Windows\System32\drivers\etc\hosts -verb runas}

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
    echo $text | less
    [System.Console]::OutputEncoding = $origin
}

