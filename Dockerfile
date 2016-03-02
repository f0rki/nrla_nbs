FROM base/archlinux

USER root
# first update package manager
RUN pacman -Syy
RUN pacman -S --noconfirm --noprogressbar pacman archlinux-keyring
RUN pacman-key --refresh-keys
RUN pacman-db-upgrade
# update all installed packages
RUN pacman -Syu --noconfirm --noprogressbar && pacman -Scc --noconfirm
# install notebook dependencies
RUN pacman -S --noconfirm --noprogressbar jupyter jupyter-notebook sagemath ipython2-notebook mathjax && pacman -Scc --noconfirm

# Add Tini to avoid zombie processes and such
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN useradd -m nbs -s /bin/bash

RUN mkdir /notebooks && chown nbs:root /notebooks

USER nbs
# make stuff world writable so there are no complaints...
RUN mkdir -p -m 777 /home/nbs/.jupyter/
RUN mkdir -p -m 777 /home/nbs/.sage/
RUN echo "c.NotebookApp.ip = '*'" >> /home/nbs/.jupyter/jupyter_notebook_config.py

USER nbs
VOLUME /notebooks
EXPOSE 8888
WORKDIR /notebooks
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook"]
