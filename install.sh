#!/usr/bin/env bash
set -eu

if ! command -v nix &> /dev/null; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

rm -f $HOME/.bashrc $HOME/.bash_profile
nix build --no-link github:rszamszur/nixos-config#homeConfigurations.coder.activationPackage
if [[ ! $(which home-manager) ]]; then
  "$(nix path-info github:rszamszur/nixos-config#homeConfigurations.coder.activationPackage)"/activate
fi

home-manager switch --flake github:rszamszur/nixos-config#coder
