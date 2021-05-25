get_latest_date() {
  curl --silent "https://api.github.com/repos/Dark-Matter7232/Onivim2-artifacts/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed 's/^.\{6\}//'                                   # Pluck JSON value
}
get_latest_version() {
  curl --silent "https://api.github.com/repos/Dark-Matter7232/Onivim2-artifacts/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    rev | 
    sed 's/^.\{11\}//' | 
    rev                                      # Pluck JSON value
}
mv onivim2 old-onivim2
sed -r -e "s/(version\s*=\s*).*/\1$(get_latest_version)/" -e "s/(_dver\s*=\s*).*/\1$(get_latest_date)/" old-onivim2 >> onivim2
rm -rf old-onivim2
