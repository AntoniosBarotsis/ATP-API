[![CD](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cd.yml/badge.svg)](https://github.com/AntoniosBarotsis/ATP-API/actions/workflows/cd.yml)

# ATP-API

This API will provide tennis related information scraped from the [ATP Tour](https://www.atptour.com) website. 

## Local Development

Note that RStudio locks some files that are required by Docker which results int he following
commands crashing, **DO CLOSE RSTUDIO** prior to building the image. When using RStudio set 
```/R``` as the working directory.


```bash
docker build -t atp-api . --no-cache --progress=plain
docker run --rm -d -p 8080:8080 atp-api
```