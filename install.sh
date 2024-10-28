#!/usr/bin/env bash
set -eu

nix build --no-link github:rszamszur/nixos-config#homeConfigurations.coder.activationPackage
if [[ ! $(which home-manager) ]]; then
  "$(nix path-info github:rszamszur/nixos-config#homeConfigurations.coder.activationPackage)"/activate
fi

home-manager switch --flake github:rszamszur/nixos-config#coder
