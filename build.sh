#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

ISO_LABEL="MOLTOS-GNOME"
ARCH="amd64"
DIST="bookworm"  # Debian stable

sudo lb clean || true

sudo lb config \
  --architectures $ARCH \
  --distribution $DIST \
  --debian-installer live \
  --archive-areas "main contrib non-free" \
  --linux-flavours "amd64" \
  --iso-volume "$ISO_LABEL" \
  --iso-application "MoltOS GNOME Edition" \
  --bootappend-live "boot=live components quiet splash" \
  --binary-images iso-hybrid

sudo lb build
