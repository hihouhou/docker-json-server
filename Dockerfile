#
# json-server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JSON_SERVER_VERSION v0.15.0

# Update & install packages
RUN apt-get update && \
    apt-get install -y gnupg2 curl

#Add yarn repository
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Update & install packages
RUN apt-get update && \
    apt-get install -y npm nodejs

# Install the server
RUN npm install -g json-server


# Launch the server
CMD ["json-server", "--watch", "db.json", "--port", "3100", "--host", "0.0.0.0"]
