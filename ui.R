# Define UI
dashboardPage(
  skin = "black", title = "Vishal Sharma CV",
  collapse_sidebar = TRUE, header, sidebar, body,
  footerOutput(outputId = "dynamicFooter"),
  div(id = "controlbar",
      dashboardControlbar()
  )
)
