FROM debian

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy procps curl ca-certificates gnupg2 build-essential --no-install-recommends && apt-get clean

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.7"
# The entry point here is an initialization process, 
# it will be used as arguments for e.g.
# `docker run` command 
RUN /bin/bash -l -c "rvm use 2.7"
RUN /bin/bash -l -c "gem install middleman"
ENTRYPOINT ["/bin/bash", "-l", "-c"]


