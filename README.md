<!-- badges: start -->
[![CD](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cd.yml/badge.svg)](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cd.yml)
[![R-CMD-check](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/AntoniosBarotsis/ATP-API/branch/master/graph/badge.svg)](https://codecov.io/gh/AntoniosBarotsis/ATP-API?branch=master)
<!-- badges: end -->


# ATP-API

This API will provide tennis related information scraped from the [ATP Tour](https://www.atptour.com) website. 

## Local Development

Note that RStudio locks some files that are required by Docker which results in the following
commands crashing, **DO CLOSE RSTUDIO** prior to building the image. 

```bash
docker build -t atp-api . --no-cache --progress=plain
docker run --rm -d -p 8080:8080 atp-api
```

You can run the tests with `rcmdcheck::rcmdcheck()`