#!/bin/bash

set -ouex pipefail

/ctx/cleanup.sh

### Setup Alloy Container
rsync -rvK /ctx/alloy/ /
chown 473:473 /etc/alloy/journal.alloy

/ctx/packages.sh

/ctx/branding.sh
