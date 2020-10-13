FROM alpine:3.12.0
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/freight-trust/vcs.git"


RUN apk add --no-cache shellcheck bash

COPY runaction /action/runaction
COPY .github/problem-matcher.json /problem-matcher.json

ENTRYPOINT ["bash", "/action/runaction"]
