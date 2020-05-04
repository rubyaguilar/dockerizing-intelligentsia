# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest

# Install Ubuntu packages
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    gdal-bin \
    proj-bin \
    libgdal-dev \
    libproj-dev

# install dependencies of the intelligentisa app
RUN R -e "install.packages('Rmpfr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('padr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgdal', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('sp', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magrittr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyBS', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgdal', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('leaflet', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('sp', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magrttr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggmap', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('xts', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyjs', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('jsonlite', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('urltools', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('utils', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rvest', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgeos', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('xml2', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('selectr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('raster', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('purrr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RColorBrewer', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('gdal')"


# copy the app to the image
COPY shiny-intelligentsia.Rproj /srv/shiny-server/
COPY app /srv/shiny-server/

# Make the ShinyApp available at port 80
EXPOSE 3838

RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]

CMD ["/usr/bin/shiny-server.sh"]