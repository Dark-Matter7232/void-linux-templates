sudo apt-get install jq
get_latest_version() {
  curl --silent "https://api.github.com/repos/librewolf-community/LibreWolf/tags" | jq -r '.[1].name'                                    # Pluck JSON value
}
mv librewolf old-librewolf
sed -r -e "s/(version\s*=\s*).*/\1$(get_latest_version)/" -e "s/(file_version\s*=\s*).*/\1$(get_latest_v)/" old-librewolf >> librewolf
rm -rf old-librewolf
