FROM alpine:latest

ENV _VERSION_TFLINT=0.20.3

RUN mkdir -p /opt/checkcheckcheck/bin

RUN cd /tmp && \
  wget "https://github.com/terraform-linters/tflint/releases/download/v${_VERSION_TFLINT}/tflint_linux_amd64.zip" && \
  unzip tflint_linux_amd64.zip && \
  mv tflint /opt/checkcheckcheck/bin && \
  rm tflint_linux_amd64.zip

WORKDIR /opt/checkcheckcheck/bin
