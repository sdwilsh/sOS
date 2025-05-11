#!/bin/bash

set -ouex pipefail

# Tweak os-release
sed -i '/^PRETTY_NAME/s/uCore minimal/sOS Core/' /usr/lib/os-release
