#!/bin/bash
get_latest_revision() {
  curl --silent "https://api.github.com/repos/macchrome/linchrome/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |                                    # Pluck JSON value
    cut -f2 -d- | 
    sed 's/^.\{1\}//' 
}
get_latest_version() {
  curl --silent "https://api.github.com/repos/macchrome/linchrome/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |                                    # Pluck JSON value
    cut -f1 -d- |
    sed 's/^.\{1\}//'
}

sed -r -e "s/(version\s*=\s*).*/\1$(get_latest_version)/" -e "s/(_chromiumRevision\s*=\s*).*/\1$(get_latest_revision)/" old-ugc-template >> ugc-template
