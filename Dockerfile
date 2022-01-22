FROM registry.access.redhat.com/ubi8/ubi:latest
RUN dnf module enable -y nodejs:16 && \
    dnf install -y git-core npm && \
    npm install -g yarn -s && \
    dnf clean all
WORKDIR /code
RUN git clone -b 1.2.14 https://github.com/matrix-org/matrix.to . && \
    yarn install

EXPOSE 5000
CMD yarn start
