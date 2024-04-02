FROM mambaorg/micromamba

COPY conda-lock.yml .
RUN --mount=type=cache,uid=$MAMBA_USER_ID,gid=$MAMBA_USER_GID,target=/opt/conda/pkgs \
    micromamba env create -y -n my-env -f conda-lock.yml
ENV PATH=/opt/conda/envs/my-env/bin:$PATH

COPY . .

CMD python my_main.py
