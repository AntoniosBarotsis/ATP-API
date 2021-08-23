FROM rstudio/plumber

WORKDIR /app

COPY . ./

# provide the port for Plumber, so that running/testing outside of Heroku is possible
# Heroku will override the PORT value at runtime
ENV PORT=8080

# install random dependencies
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev \
      libsodium-dev \
      libhiredis-dev \
      apt-utils

RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get install -y redis-server

RUN R -e "install.packages(c('redux', 'logging', 'callr', 'rcmdcheck', 'testthat', 'httr', 'covr'))"

RUN chmod +x /app/start.sh

ENTRYPOINT /app/start.sh