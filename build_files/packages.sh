#!/bin/bash

set -ouex pipefail

dnf -y copr enable atim/starship

CHEZMOI_VERSION=2.62.3

dnf -y install \
    atuin \
    fish \
    starship \
    https://github.com/twpayne/chezmoi/releases/download/v${CHEZMOI_VERSION}/chezmoi-${CHEZMOI_VERSION}-$(arch).rpm

# For dev-sec hardening of SSH
dnf -y install \
    checkpolicy \
    openssh \
    python3-dnf \
    python3-policycoreutils
