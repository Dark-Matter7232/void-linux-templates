#!/bin/bash
get_latest_version() {
    wget --content-disposition -q https://tlauncher.org/jar |
    basename TLauncher-* | 
    sed 's/^.\{10\}//' | 
    rev | 
    sed 's/^.\{4\}//' | 
    rev
}
get_latest_version
mv tl-template old-tl-template
sed -r "s/(version\s*=\s*).*/\1$(get_latest_version)/" old-tl-template >> tl-template
rm -rf old-tl-template
rm -rf TL*
