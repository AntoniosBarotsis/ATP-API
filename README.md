<!-- badges: start -->
[![CICD](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cicd.yml/badge.svg)](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cicd.yml)
[![Codecov test coverage](https://codecov.io/gh/AntoniosBarotsis/ATP-API/branch/master/graph/badge.svg)](https://codecov.io/gh/AntoniosBarotsis/ATP-API?branch=master)
<!-- badges: end -->


# ATP-API

This API will provide tennis related information scraped from the [ATP Tour](https://www.atptour.com) website. 

## ⚠️ Project Discontinued ⚠️

The website is using Cloudflare which protects against scraping so this whole project is impossible to complete and is therefore discontinued.
I will keep the repository up however because of all the things that I configured (docker, redis, codecov, CICD, unit testing and mocks) since I know
I'm gonna look back to this whenever I decide to build something new in R.

## Local Development

Note that RStudio locks some files that are required by Docker which results in the following
commands crashing, **DO CLOSE RSTUDIO** prior to building the image. 

```bash
docker build -t atp-api . --no-cache --progress=plain
docker run --rm -d -p 8080:8080 atp-api
```

You can run the tests with `devtools::test()`.

In order to run the app outside of a container you must run `Sys.setenv(ENV="PROD")` beforehand, note that the cache will not be used outside of a container
(unless you are running your own instance).