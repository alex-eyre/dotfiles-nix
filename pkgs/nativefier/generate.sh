#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nodePackages.node2nix

set -eu -o pipefail

exec node2nix \
    -i node-packages.json -o node-packages.nix \
    -c nativefier.nix
