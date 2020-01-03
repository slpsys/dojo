FROM phusion/baseimage:0.11

LABEL Description="AWS CLI tools are not great multiaccounts"

## Set up services
# CMD ["/sbin/my_init"]

# Pull in Ubuntu packages
RUN apt-get -qq update && \
    apt-get -qq -y install curl jq python python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /dojo && \
    chgrp users /dojo && \
    chmod 775 /dojo

## Install AWS
RUN pip install awscli

## Set the root directory to be the dojo Docker Volume. This ensures that notebooks
## will be stored locally by Docker, even if you stop the specific container.
## *MAKE SURE* that you run `./setup` first to initialize this locally with Docker
WORKDIR /dojo
