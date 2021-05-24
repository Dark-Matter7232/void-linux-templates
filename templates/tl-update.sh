#!/bin/bash
get_latest_version() {
    wget https://tlauncher.org/jar |
    basename TLauncher-* | 
    sed 's/^.\{10\}//' | 
    rev | 
    sed 's/^.\{4\}//' | 
    rev
}
sed -r "s/(version\s*=\s*).*/\1$(get_latest_version)/" old-tl-template >> tl-template
