# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/ucore-minimal:stable@sha256:ba9cd56b84ce394cba17d8a4f869e89f8ed58b737bc07abe9fa18f63d009dd35

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit
    
# Verify final image and contents are correct.
# This fails right now for ucore:
# https://github.com/ublue-os/ucore/issues/248
# RUN bootc container lint