#!/bin/bash

set -ouex pipefail

/ctx/cleanup.sh

### Setup Alloy Container
rsync -rvK /ctx/alloy/ /
chown 473:473 /etc/alloy/journal.alloy

### Setup Node Exporter Container
rsync -rvK /ctx/node-exporter/ /

/ctx/packages.sh

/ctx/branding.sh
