FROM docker.io/library/debian:testing
LABEL maintainer="ZeroExistence"

RUN apt-get -y update && apt-get -y install bash curl git live-build cdebootstrap vim

CMD ["/bin/bash"]
