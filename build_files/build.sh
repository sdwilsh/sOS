#!/bin/bash

set -ouex pipefail

### Setup Alloy Container
rsync -rvK /ctx/alloy/ /

/ctx/packages.sh

/ctx/branding.sh
/ctx/cleanup.sh
