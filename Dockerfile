FROM r-base

COPY ./R ./app
COPY start.sh ./app

WORKDIR /app

# provide the port for Plumber, so that running/testing outside of Heroku is possible
# Heroku will override the PORT value at runtime
ENV PORT=8080

# install random dependencies
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev \
      libsodium-dev \
      libhiredis-dev

RUN R -e "install.packages(c('plumber', 'redux'))"

CMD ["/bin/bash", "start.sh"]