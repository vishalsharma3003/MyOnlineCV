# load packages
library(shiny)
library(ygdashboard)
library(shinyWidgets)
library(ggplot2)
library(purrr)
library(stringr)

# Load the template components
source("header.R")
source("sidebar.R")
source("profile_box.R")
source("about_box.R")
source("skills_box.R")
source("network_box.R")
source("project_box.R")
source("publication_box.R")
source("teaching_box.R")
source("main_box.R")
source("body.R")
source("dashboardControlbar.R")
source("loading_data.R")

# take random adminLTE colors (I just removed black)
col <- rep(c(
  "light-blue",
  "aqua",
  "green",
  "orange",
  "purple",
  "maroon",
  "gray",
  "teal",
  "navy",
  "red",
  "yellow"
), 10)

# determine if the CV is in the local mode on online mode
# shinyappas.io
view_mode <- readRDS(file = "www/view_mode.rds")

# loading the cv config which was passed to view_shinyCV
cv_config <- readRDS(file = "www/cv_config_saved/cv_config.rds")
if (view_mode == "local") cv_path <- cv_config$path else cv_path <- getwd()
cv_mode <- cv_config$mode
data_source <- cv_config$data_source

# loading the datas
datas <- readRDS(file = "www/cv_datas.rds")

# images for the projects
project_images <- rep(c(
  paste0(cv_path, "/www/checklist.svg"),
  paste0(cv_path, "/www/calendar.svg"),
  paste0(cv_path, "/www/bulb.svg"),
  paste0(cv_path, "/www/document.svg"),
  paste0(cv_path, "/www/checklist-2.svg"),
  paste0(cv_path, "/www/checklist-3.svg"),
  paste0(cv_path, "/www/presentation.svg")
), 10)

timelineLabel2 <- function (text, color) 
{
  label <- tags$li(class = "timeline", tags$span(class = paste0("bg-", color, " pads"), text))
}
