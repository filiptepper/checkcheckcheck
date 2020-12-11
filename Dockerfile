FROM alpine:latest

ENV _VERSION_TFLINT=0.22.0
ENV _VERSION_TERRAFORM=0.13.5
ENV _VERSION_REVIEWDOG=0.11.0

RUN mkdir -p /opt/checkcheckcheck/bin

RUN apk add --no-cache git
RUN apk add --no-cache bash
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache jq

RUN cd /tmp && \
  wget "https://github.com/terraform-linters/tflint/releases/download/v${_VERSION_TFLINT}/tflint_linux_amd64.zip" && \
  unzip tflint_linux_amd64.zip && \
  mv tflint /opt/checkcheckcheck/bin && \
  rm tflint_linux_amd64.zip

RUN cd /tmp && \
  wget "https://releases.hashicorp.com/terraform/${_VERSION_TERRAFORM}/terraform_${_VERSION_TERRAFORM}_linux_amd64.zip" && \
  unzip "terraform_${_VERSION_TERRAFORM}_linux_amd64.zip" && \
  mv terraform /opt/checkcheckcheck/bin && \
  rm "terraform_${_VERSION_TERRAFORM}_linux_amd64.zip"

RUN cd /tmp && \
  wget "https://github.com/reviewdog/reviewdog/releases/download/v${_VERSION_REVIEWDOG}/reviewdog_${_VERSION_REVIEWDOG}_Linux_x86_64.tar.gz" && \
  tar -xf "reviewdog_${_VERSION_REVIEWDOG}_Linux_x86_64.tar.gz" && \
  mv reviewdog /opt/checkcheckcheck/bin && \
  rm "reviewdog_${_VERSION_REVIEWDOG}_Linux_x86_64.tar.gz"

ENV PATH="/opt/checkcheckcheck/bin:${PATH}"

WORKDIR /opt/checkcheckcheck/bin
