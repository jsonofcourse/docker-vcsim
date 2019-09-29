FROM golang:latest

COPY docker-entrypoint.sh /

# download and compile vcsim
RUN go get -u github.com/vmware/govmomi/vcsim

# default exposed port is 8989
EXPOSE 8989

# run start command
ENTRYPOINT ["/docker-entrypoint.sh"]
