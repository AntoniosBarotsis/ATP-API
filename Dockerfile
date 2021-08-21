FROM r-base

COPY ./R ./app

WORKDIR /app

# provide the port for Plumber, so that running/testing outside of Heroku is possible
# Heroku will override the PORT value at runtime
ENV PORT=8080

# install random dependencies
RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev \
      libsodium-dev

RUN R -e "install.packages('plumber')"

CMD ["Rscript", "app.R"]