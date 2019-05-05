## Totally random build from 2019-05-05, because Jupyter doesn't tag builds in any meaningful way.
FROM jupyter/scipy-notebook:56cf0bc13e65

## Necessary to install things
USER root

## Install some nice-to-have CLI extras
RUN apt-get -qq update && \
    apt-get -qq -y install curl jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Back to Notebook user
USER $NB_UID

## Set the root directory to be the condaxploratorium Docker Volume. This ensures that notebooks
## will be stored locally by Docker, even if you stop the specific container.
## *MAKE SURE* that you run `./setup` first to initialize this locally with Docker
WORKDIR /dojo

