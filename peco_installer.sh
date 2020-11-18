#!/bin/bash

# need sudo

set -eu

## functions
# is this ARM?
is_arm() {
    grep --quiet "^model name\s*:\s*ARMv" /proc/cpuinfo >/dev/null 2>&1
    return $?
}

## main
# if peco installed, then nothing to do.
if type "peco" >/dev/null 2>&1; then
    :
fi

# get latest version tag

latest=$(
    curl -fsSI https://github.com/peco/peco/releases/latest |
        tr -d '\r' |
        awk -F'/' '/^location:/{print $NF}'
)

# if latest is null, then nothing to do.
: "${latest:?}"

URLBase="https://github.com/peco/peco/releases/download/${latest}"

if is_arm; then
    #FIXME: currently, don't verify arm or arm64
    URL="${URLBase}/peco_linux_arm.tar.gz"
    TGT="peco_linux_arm/peco"
else
    URL="${URLBase}/peco_linux_amd64.tar.gz"
    TGT="peco_linux_amd64/peco"
fi

echo "$URL"

curl -fsSL "$URL" | tar -xz --to-stdout $TGT >/tmp/peco
chmod +x /tmp/peco
sudo mv /tmp/peco /usr/local/bin/peco

peco --version
