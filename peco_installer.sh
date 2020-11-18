#!/bin/bash
# needed sudo

set -eu

# peco installed?
if type "peco" > /dev/null 2>&1; then
    :
else
    latest=$(
    curl -fsSI https://github.com/peco/peco/releases/latest |
        tr -d '\r'| 
        awk -F'/' '/^location:/{print $NF}'
    )

    : ${latest:?}

    curl -fsSL "https://github.com/peco/peco/releases/download/${latest}/peco_linux_amd64.tar.gz" |
        tar -xz --to-stdout peco_linux_amd64/peco > /tmp/peco

    chmod +x /tmp/peco

    sudo mv /tmp/peco /usr/local/bin/peco

    peco --version
fi
