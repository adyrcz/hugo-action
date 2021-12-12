FROM golang:1.16.12-alpine3.15

# Github labels
LABEL "com.github.actions.name"="Hugo-Action"
LABEL "com.github.actions.description"="Github Action for Hugo"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/adyrcz/hugo-action"
LABEL "homepage"="https://www.adyrcz.com"
LABEL "maintainer"="adyrcz@gmail.com"


# Install C and git
RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN apk add --no-cache git

# Add hugo v0.90.1
RUN git clone --branch v0.90.1 https://github.com/gohugoio/hugo.git /hugo
RUN cd /hugo; go install

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
