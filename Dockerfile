FROM continuumio/miniconda3

COPY environment.yml .
RUN --mount=type=cache,target=/opt/conda/pkgs \
    conda env create -y -f environment.yml
ENV PATH=/opt/conda/envs/my-env/bin:$PATH

COPY . .

CMD python my_main.py
