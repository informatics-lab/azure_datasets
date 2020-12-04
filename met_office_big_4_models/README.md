# Met Office atmospheric model data sets

A datasets of output from the UK Met Offices main weather forecasting (atmospheric) models.

## License
See [LICENCE.txt](LICENCE.txt).

## Models

The available models are:

* **MOGREPS-UK** - a high resolution atmospheric ensembles model for the UK.
* **UK-V** - a high resolution deterministic atmospheric model for the UK.
* **MOGREPS-G** - a global atmospheric ensembles model.
* **Global** -  a global atmospheric model.

For further details on the models see [Numerical weather prediction models
 on the Met Office Website](https://www.metoffice.gov.uk/research/approach/modelling-systems/unified-model/weather-forecasting).

## Parameters / variables

The parameters available in this dataset are listed below. Not all parameters me be available for all models.

See [Discover our data on the Met Office website](https://www.metoffice.gov.uk/services/data/met-office-data-for-reuse/discovery) for details about the specific parameters. **Note `PT01H` means taken over a period of one hour rather than an instantaneous value**

* cloud_amount_of_low_cloud
* cloud_amount_of_medium_cloud
* cloud_amount_of_total_cloud
* fog_fraction_at_screen_level
* hail_fall_accumulation-PT01H
* height_ASL_at_freezing_level
* lightning_flash_accumulation-PT01H
* radiation_flux_in_longwave_downward_at_surface
* radiation_flux_in_shortwave_diffuse_downward_at_surface
* radiation_flux_in_shortwave_direct_downward_at_surface
* radiation_flux_in_shortwave_total_downward_at_surface
* rainfall_accumulation-PT01H
* relative_humidity_at_screen_level
* sensible_heat_flux_at_surface
* snow_depth_water_equivalent
* snowfall_accumulation-PT01H
* soil_temperature_on_soil_levels
* temperature_at_screen_level
* temperature_at_screen_level_max-PT01H
* temperature_at_screen_level_min-PT01H
* temperature_at_surface
* temperature_on_height_levels
* visibility_at_screen_level
* wet_bulb_potential_temperature_on_pressure_levels
* wind_direction_at_10m
* wind_speed_at_10m
* wind_speed_at_10m_max-PT01H

## File naming convention

The files (objects/blobs in the blob store) follow a strict naming convention that removes the need for listing/searching through the millions of files in this dataset.

Each filename follow the format:

`{model}/{model_start}/{validity_time}-{forecast_step}-{diagnostic_name}.nc`

Where `model` is one of: 

* `mo-atmospheric-mogreps-g`
* `mo-atmospheric-mogreps-uk`
* `mo-atmospheric-ukv`
* `mo-atmospheric-ukg`

For example where:

* `model` = MOGREPS-G = `mo-atmospheric-mogreps-g`
* `model_start` = the first time step in the model. E.g. 6pm on 01/12/2020 = `20201201T1800Z`
* `validity_time` = the date time it is a forecast for. E.g. 6pm the next day (02/12/2020) = `20201202T1800Z`
* `forecast_step` = the time period from the `model_start` of the forecast. The `model_start` + `forecast_step` should equal the `validity_time`. E.g. 24h after the model start = `PT0024H00M`
* `diagnostic_name` = the parameter/variable/phenomena of interest. Should be from the list above. E.g. surface temperature = `temperature_at_surface`

would give you the filename:

`mo-atmospheric-mogreps-g/20201201T1800Z/20201202T1800Z-PT0024H00M-temperature_at_surface.nc`