#!/bin/bash

set -ouex pipefail

# Remove some things that upstream adds that are unwanted.
dnf -y remove \
  cockpit-networkmanager \
  cockpit-podman \
  cockpit-selinux \
  cockpit-system \
  tailscale \
  tmux
rm -f /usr/lib/systemd/system/cockpit.service
