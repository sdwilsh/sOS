#!/bin/bash

set -ouex pipefail

/ctx/cleanup.sh

### Setup Alloy Container
rsync -rvK /ctx/alloy/ /

/ctx/packages.sh

/ctx/branding.sh
