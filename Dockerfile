FROM python:3

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get upgrade -y \
 && apt-get install -y nodejs texlive-latex-extra texlive-xetex \
 && rm -rf /var/lib/apt/lists/*

ENV JUPYTERLAB_VERSION=1.2.8
RUN pip install --upgrade pip \
 && pip install --upgrade \
        jupyterlab==$JUPYTERLAB_VERSION \
        ipywidgets jupyterlab_latex plotly bokeh numpy scipy numexpr patsy scikit-learn \
        scikit-image matplotlib ipython pandas sympy seaborn nose jupyterlab-git \
 && jupyter lab --generate-config

RUN jupyter labextension install \
        @jupyter-widgets/jupyterlab-manager \
        @jupyterlab/latex \
        @mflevine/jupyterlab_html \
        jupyterlab-drawio \
        @jupyterlab/plotly-extension \
        jupyterlab-spreadsheet \
        @jupyterlab/git

EXPOSE 8888

VOLUME /root/.ssh
VOLUME /root/.jupyter

VOLUME /notebooks
WORKDIR /notebooks

ENTRYPOINT ["jupyter", "lab"]
