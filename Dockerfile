FROM continuumio/miniconda3

COPY . .
RUN conda env create -y -f environment.yml
ENV PATH=/opt/conda/envs/my-env/bin:$PATH

CMD python my_main.py
