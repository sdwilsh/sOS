# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/ucore-minimal:stable@sha256:5f4bc7c27aa2267f70645f37e18c603695eae202dcb117be0a579ca1460f4ab7

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