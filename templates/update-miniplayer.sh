#!/bin/bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/GuardKenzie/miniplayer/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed 's/^.\{1\}//'                                   # Pluck JSON value
}
mv miniplayer old-miniplayer
sed -r "s/(version\s*=\s*).*/\1$(get_latest_release)/" old-miniplayer >> miniplayer
rm -rf old-miniplayer
