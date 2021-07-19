FROM rapporteket/rap-dev-data:nodata

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# system libraries of general use
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libssl-dev \
    libmariadbclient-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('binom',\
                             'covr',\
                             'dplyr',\
                             'janitor'\
                             'kableExtra',\
                             'knitr',\
                             'lintr',\
                             'lubridate',\
                             'magrittr',\
                             'readr',\
                             'rlang',\
                             'rmarkdown',\
                             'rpivotTable',\
                             'shiny',\
                             'shinyalert',\
                             'shinycssloaders',\
                             'stringr',\
                             'testthat',\
                             'tidyselect',\
                             'xtable'))"

RUN R -e "remotes::install_github(c('Rapporteket/rapbase@*release'))"
