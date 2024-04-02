FROM continuumio/miniconda3

COPY environment.yml .
RUN conda env create -y -f environment.yml \
 && conda clean -ya
ENV PATH=/opt/conda/envs/my-env/bin:$PATH

COPY . .

CMD python my_main.py
