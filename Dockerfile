FROM mambaorg/micromamba as builder

COPY conda-lock.yml .
RUN --mount=type=cache,uid=$MAMBA_USER_ID,gid=$MAMBA_USER_GID,target=/opt/conda/pkgs \
    micromamba env create -y -n my-env -f conda-lock.yml

###

FROM ubuntu:22.04

RUN mkdir -p /opt/conda/envs/my-env
COPY --from=builder /opt/conda/envs/my-env /opt/conda/envs/my-env
ENV PATH=/opt/conda/envs/my-env/bin:$PATH

COPY . .

CMD python my_main.py
