# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/ucore-minimal:stable@sha256:5fe76d1ada5ef5df64e5b20c62a83730f20f912fe4110cc196d0b0443c040f95

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