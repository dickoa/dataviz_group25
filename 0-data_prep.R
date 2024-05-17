library(tidyverse)
library(arrow)
library(dm)
library(tidygeocoder)
library(sf)
library(ggspatial)
library(ggrepel)
library(ggtext)
library(ggridges)
library(ggdist)
library(rgeoboundaries)
library(hrbrthemes)
library(waterfalls)
library(waffle)
library(extrafont)


### Locations
plants <- read_csv("./data/Plants.csv", col_types = cols(`...1` = col_skip()))
glimpse(plants)

vendors <- read_csv("./data/Vendors.csv", col_types = cols(`...1` = col_skip()))
glimpse(vendors)


loc_plants <- plants |>
  geocode(street = PlantStreet,
          city = PlantCity,
          postalcode = PlantPostalCode)

loc_vendors <- vendors |>
  mutate(VendorAddress = paste0(VendorStreet, ", ", VendorCity, ", ",
                                VendorPostalCode, ", ", VendorCountry)) |>
  geocode(address = VendorAddress, method = "arcgis")


loc_vendors <- st_as_sf(loc_vendors, coords = c("long", "lat"), crs = 4326)

write_sf(loc_vendors,
         "./data/loc_vendors.geojson",
         delete_dsn = TRUE)

loc_plants <- st_as_sf(loc_plants, coords = c("long", "lat"), crs = 4326)


write_sf(loc_plants,
         "./data/loc_vendors.geojson",
         delete_dsn = TRUE)

loc_plants <- loc_plants |>
  transmute(type = PlantType, city = PlantCity)

loc_vendors <- loc_vendors |>
  transmute(type = "Vendor", city = VendorCity, country = VendorCountry)


loc_plants <- loc_plants |>
  mutate(country = case_match(city,
                              "Antwerp" ~ "Belgium",
                              "Wrocław" ~ "Poland",
                              "Lyon" ~ "France",
                              "Antwerp" ~ "Belgium",
                              "Wrocław" ~ "Poland",
                              "Lyon" ~ "France",
                              "Birmingham" ~ "United Kingdom",
                              "Göteborg" ~ "Sweden"))



loc <- bind_rows(loc_plants, loc_vendors)

write_sf(loc,
         "./data/loc_plants_vendors.geojson",
         delete_dsn = TRUE)

### Material
material <- read_csv("./data/Materials.csv", col_types = cols(`...1` = col_skip()))
glimpse(material)


### Purchases
purchase <- read_csv("./data/Purchases.csv", col_types = cols(`...1` = col_skip()))
glimpse(purchase)

purchase <- purchase |>
  left_join(plants,
            by = join_by(PlantKey)) |>
  left_join(material,
            by = join_by(MaterialKey)) |>
  left_join(vendors,
            by = join_by(VendorKey))


purchase <- purchase |>
  mutate(gap_goods_receipt_date = as.integer(ActualGoodsReceiptDate - PlannedGoodsReceiptDate),
         gap_arrival_date_yard  = as.integer(ActualArrivalDateYard - PlannedArrivalDateYard),
         gap_vendor_shipment_date = as.integer(ActualVendorShipmentDate - PlannedVendorShipmentDate))

gap_purchase <- purchase |>
  select(VendorName, PlantName, starts_with("gap")) |>
  pivot_longer(cols = starts_with("gap"),
               names_to = "gap",
               values_to = "day") |>
  mutate(gap = str_replace_all(gap, "gap_", ""),
         gap_label = case_match(gap,
                                "vendor_shipment_date" ~ "Vendor shipment",
                                "arrival_date_yard" ~ "Arrival at yard",
                                "goods_receipt_date" ~ "Goods receipt",
                                .default = gap))
glimpse(gap_purchase)


write_csv(gap_purchase, "./data/gap_purchase.csv")



###
material_plant <- read_csv("./data/MaterialPlantRelation.csv",
                           col_types = cols(`...1` = col_skip()))
glimpse(material_plant)

 material_plant <- material_plant |>
  left_join(plants,
            by = join_by(PlantKey)) |>
  left_join(material,
            by = join_by(MaterialKey))

###
inventory <- read_csv("./data/Inventory.csv", col_types = cols(`...1` = col_skip()))
glimpse(inventory)

inventory <- inventory  |>
  left_join(plants,
            by = join_by(PlantKey)) |>
  left_join(material,
            by = join_by(MaterialKey))


##
invent <- inventory |>
  select(SnapshotDate, MaterialDescription,
         PlantName, OnShelfInventoryQuantity, InTransitQuantity) |>
  pivot_longer(cols = c(OnShelfInventoryQuantity, InTransitQuantity))


write_csv(invent, "./data/inventory_wide.csv")



### Forecast
forecast <- read_csv("./data/Forecast.csv", col_types = cols(`...1` = col_skip()))
glimpse(forecast)

###
forecast <- forecast |>
  left_join(plants,
            by = join_by(PlantKey)) |>
  left_join(material,
            by = join_by(MaterialKey))
glimpse(forecast)


###
forecast |>
  ggplot(aes(RequestedDeliveryMonth, Quantity,
             color = MaterialDescription)) +
  geom_point(size = 1, show.legend = FALSE) +
  geom_line(show.legend = FALSE) +
  scale_color_manual(values = c("EV Car Battery" = "#A33075",
                                "Home Battery" = "#F1A72A")) +
  facet_wrap(vars(PlantName)) +
  labs(title = "<span style = 'color:#A33075'>EV Car Battery</span> and <span style = 'color:#F1A72A'>Home Battery</span> forecasted quantity by Distribution Centers",
       caption = "Source: SunCharge Supply Chain Information System") +
  theme_ipsum(grid = "Y") +
  theme(plot.title = element_markdown(face = "bold"),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())


###
sales <- read_csv("./data/Sales.csv", col_types = cols(`...1` = col_skip()))
glimpse(sales)

###
customers <- read_csv("./data/Customers.csv", col_types = cols(`...1` = col_skip()))
glimpse(customers)

loc_customers <- customers |>
  mutate(CustomerAddress = paste0(CustomerStreet, ", ", CustomerCity, ", ",
                                  CustomerPostalCode, ", ", CustomerCountry))

file <- "./data/loc_customers.geojson"

if (file.exists(file)) {
  loc_customers <- read_sf("./data/loc_customers.geojson")
} else {
  loc_customers <- geocode(loc_customers, address = CustomerAddress, method = "arcgis")
  loc_customers <- st_as_sf(loc_customers, coords = c("long", "lat"), crs = 4326)

  write_sf(loc_customers,
         "./data/loc_customers.geojson",
         driver = "GeoJSON",
         delete_layer = TRUE,
         delete_dsn = TRUE)
}
