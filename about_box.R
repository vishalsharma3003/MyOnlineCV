about_box <- function(phone, mail, location, linkedin_link,
                      twitter_link, facebook_link, github_link, stackoverflow_link) {
  tags$div(
    class = "box box-primary",
    ## Box Header ##
    tags$div(
      class = "box-header with-border",
      tags$h3(class = "box-title", "About Me"),
      # Box buttons
      tags$div(
        class = "box-tools pull-right",
        # collapse button
        tags$button(
          type = "button", class = "btn btn-box-tool", `data-widget` = "collapse",
          tags$i(class = "fa fa-minus")
        ),
        # close button
        tags$button(
          type = "button", class = "btn btn-box-tool", `data-widget` = "remove",
          tags$i(class = "fa fa-times")
        )
      )
    ),
    ## Box Body ##
    tags$div(
      class = "box-body",
      # tel/Mail and Web
      tags$strong(tags$i(class = "fa fa-at margin-r-5"), "Tel & Mail"),
      if (!is.null(phone)) {
        tags$p(class = "text-muted", phone)
      },
      tags$p(class = "text-muted",
             a(href = paste0("mailto:", mail), target = "_top", "Contact me!")
      ),
      tags$hr(),

      # Location
      tags$strong(tags$i(class = "fa fa-map-marker margin-r-5"), "Location"),
      tags$p(class = "text-muted", location),
      tags$hr(),

      # Social Networks
      tags$strong(tags$i(class = "fa fa-map-pencil margin-r-5"), "Social Network"),
      tags$p(
        # linkedin
        if (!is.null(linkedin_link)) {
          tags$div(
            class = "col-sm-4",
            a(href = linkedin_link, target = "_blank",
              tags$span(class = "label bg-navy",
                        HTML(paste(icon("linkedin"),"Linkedin"))
              )
            )
          )
        },
        # twitter
        if (!is.null(twitter_link)) {
          tags$div(
            class = "col-sm-4",
            a(href = twitter_link, target = "_blank",
              tags$span(class = "label label-info",
                        HTML(paste(icon("twitter-square"),"Twitter"))
              )
            )
          )
        },
        # fecebook
        if (!is.null(facebook_link)) {
          tags$div(
            class = "col-sm-4",
            a(href = facebook_link, target = "_blank",
              tags$span(class = "label label-primary",
                        HTML(paste(icon("facebook-square"),"Facebook"))
              )
            )
          )
        },
        # github
        if (!is.null(github_link)) {
          tags$div(
            class = "col-sm-4",
            a(href = github_link, target = "_blank",
              tags$span(class = "label bg-purple",
                        HTML(paste(icon("github-square"),"Github"))
              )
            )
          )
        },
        # stackoverflow
        if (!is.null(stackoverflow_link)) {
          tags$div(
            class = "col-sm-4",
            a(href = stackoverflow_link, target = "_blank",
              tags$span(class = "label bg-orange",
                        HTML(paste(icon("stack-overflow"),"StackOverflow"))
              )
            )
          )
        }
      )
    )
  )
}
