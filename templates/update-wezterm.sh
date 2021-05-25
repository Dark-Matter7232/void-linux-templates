get_latest_version() {
  curl --silent "https://api.github.com/repos/wez/wezterm/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    cut -f1 -d-                                   # Pluck JSON value
}
get_latest_v() {
  curl --silent "https://api.github.com/repos/wez/wezterm/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                   # Pluck JSON value
}
mv wezterm wezterm-old
sed -r -e "s/(version\s*=\s*).*/\1$(get_latest_version)/" -e "s/(_v\s*=\s*).*/\1$(get_latest_v)/" old-wezterm >> wezterm
rm -rf wezterm-old
