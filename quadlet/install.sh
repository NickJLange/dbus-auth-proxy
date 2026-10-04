#!/bin/sh
# Installs the dbus-auth-proxy quadlet units for the current user, building the
# image from this checkout. Safe to re-run.
set -eu

repo=$(cd "$(dirname "$0")/.." && pwd -P)
dest=${XDG_CONFIG_HOME:-$HOME/.config}/containers/systemd

mkdir -p "$dest"
sed "s|@REPO_DIR@|$repo|g" "$repo/quadlet/dbus-auth-proxy.build.in" \
  > "$dest/dbus-auth-proxy.build"
cp "$repo/quadlet/dbus-auth-proxy.container" "$dest/dbus-auth-proxy.container"
systemctl --user daemon-reload

echo "Installed quadlet units to $dest (build context: $repo)"
