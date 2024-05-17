library(sf)
library(tidyverse)
library(leaflet)
library(leaflet.extras)
library(mapboxapi)
library(bslib)
library(bsicons)
library(fontawesome)
library(ggridges)
library(r2d3)
library(ggtext)
library(hrbrthemes)

mb_access_token(token = Sys.getenv("MAPBOX_UNHCR_TOKEN"),
                install = FALSE,
                overwrite = FALSE)

loc_plants_vendors <- read_sf("./data/loc_plants_vendors.geojson")

loc_plants_vendors$label <- paste0(loc_plants_vendors$type,
                                   " at <b>", loc_plants_vendors$city,
                                   ", ", loc_plants_vendors$country, "</b>")

loc_customers <- read_sf("./data/loc_customers.geojson")
loc_customers <- filter(loc_customers,
       !CustomerKey %in% c(1127, 1046, 1009, 913, 792))

loc_customers$label <- paste0(loc_customers$CustomerName,
                              " at <b>", loc_customers$CustomerCity,
                              ", ", loc_customers$CustomerCountry, "</b>")


mapview::mapview(loc_customers)
coord <- as.data.frame(st_coordinates(loc_customers))
names(coord) <- c("long", "lat")

invent <- read_csv("./data/inventory_wide.csv")

markers <- awesomeIconList(
  industry = makeAwesomeIcon(
    icon = 'industry',
    library = 'fa',
    iconColor = '#FFFFFF',
    markerColor = '#db0062'),
  Production = makeAwesomeIcon(
    icon = 'industry',
    library = 'fa',
    iconColor = '#FFFFFF',
    markerColor = '#0ca688'),
  `Distribution Center` = makeAwesomeIcon(
    icon = 'industry',
    library = 'fa',
    iconColor = '#FFFFFF',
    markerColor = '#fbc711'),
  user = makeAwesomeIcon(
    icon = 'user',
    library = 'fa',
    iconColor = '#FFFFFF',
    markerColor = '#808080'))
loc_customers
