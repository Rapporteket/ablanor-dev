FROM rapporteket/dev:weekly

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

ARG GH_PAT
ENV GITHUB_PAT=${GH_PAT}

# add registry dev config and R pkg dependencies
COPY --chown=rstudio:rstudio db.yml ${R_RAP_CONFIG_PATH}/
RUN cat ${R_RAP_CONFIG_PATH}/db.yml >> ${R_RAP_CONFIG_PATH}/dbConfig.yml \
    && rm ${R_RAP_CONFIG_PATH}/db.yml \
    && chmod ugo+rw ${R_RAP_CONFIG_PATH}/* \
    && R -e "install.packages(c('binom', \
                                'covr', \
                                'dplyr', \
                                'DT', \
                                'janitor', \
                                'kableExtra', \
                                'knitr', \
                                'lintr', \
                                'lubridate', \
                                'magrittr', \
                                'rapbase', \
                                'readr', \
                                'rlang', \
                                'rmarkdown', \
                                'rpivotTable', \
                                'shiny', \
                                'shinyalert', \
                                'shinycssloaders', \
                                'stringr', \
                                'testthat', \
                                'tidyselect', \
                                'xtable'))"

