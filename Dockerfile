FROM rocker/rstudio as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN apt-get update && apt-get install zlib1g-dev && libxml2-dev

RUN mkdir code
RUN mkdir output
COPY code code
COPY Makefile .
COPY FPreport.Rmd .

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache
ENV RENV_WATCHDOG_ENABLED = FALSE

RUN R -e "renv::restore()"

RUN mkdir final_project
