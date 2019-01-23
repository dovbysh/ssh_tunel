FROM ubuntu:bionic

RUN apt update
RUN apt install --no-install-recommends -y ssh

ARG UID
ARG GID

RUN echo $GID
RUN groupadd --gid $GID -f simple
RUN useradd --gid $GID --uid $UID --create-home simple
