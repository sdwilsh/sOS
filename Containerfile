# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/ucore-minimal:stable@sha256:debd5ca2c49ca7aa7e671ce9d233fea70c18579a471414dd3b6519a5dd5477eb

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