# define server function
shinyServer(function(input, output, session) {

  # check if the user has provided its own data via
  # feed_shinyCV
  if (data_source == "manual") {
    df <- reactiveValues(
      my_profile = datas$my_profile,
      about = datas$about,
      skills = datas$skills,
      languages = datas$languages,
      users = datas$network,
      formations = datas$formations,
      tasks = datas$tasks,
      projects = datas$projects,
      publications = datas$publications,
      publications_screenshots = datas$publications_screenshots,
      talks = datas$talks,
      courses = datas$course,
      internships = datas$internships
    )
  } else {
    # if there are existing data
    # initialization of data cv.
    # If the cv has been saved previously,
    # load the last saved state instead
    if (!is.null(datas)) {
      # old df is not reactive
      old_df <- datas
      # create a new reactive df based on old values
      df <- reactiveValues(
        my_profile = old_df$my_profile,
        about = old_df$about,
        skills = old_df$skills,
        languages = old_df$languages,
        users = old_df$users,
        formations = old_df$formations,
        tasks = old_df$tasks,
        projects = old_df$projects,
        publications = old_df$publications,
        publications_screenshots = old_df$publications_screenshots,
        talks = old_df$talks,
        courses = old_df$courses,
        internships = old_df$internships
      )
    } else {
      df <- reactiveValues(
        my_profile = list(),
        about = data.frame(),
        skills = data.frame(),
        languages = data.frame(),
        users = data.frame(),
        formations = data.frame(),
        tasks = list(),
        projects = data.frame(),
        publications = data.frame(),
        publications_screenshots = list(),
        talks = data.frame(),
        courses = data.frame(),
        internships = data.frame()
      )
    }
  }

  # useful for temporary storage
  temp <- reactiveValues(tasks = data.frame())

  #-------------------------------------------------------------------------
  #
  #  Profil section ...
  #
  #-------------------------------------------------------------------------

  # generate the user image if any
  output$image <- renderImage({
    my_image <- df$my_profile$my_image
    if (!is_empty(my_image)) {
      # in demo mode, launch the app with a demo profile image
      if (data_source == "manual") {
        # if datas are provided by the user, we use
        # the same path as with the demo code
        # so the image will be that choosen by the user
        # and not that by the demo
        if (view_mode == "local") path <- my_image$src else path <- paste0(cv_path, "/www/man.png")
      } else {
        # if the user use the from_cvbuilder mode
        if (view_mode == "local") {
          data_path <- paste0(cv_path, "/www/cv_datas.rds")
          if (file.exists(data_path) == TRUE) {
            path <- paste0(cv_path, "/www/Profile_img_saved/", "0.png")
          }
        } else {
          path <- paste0(cv_path, "/www/Profile_img_saved/0.png")
        }
      }
      list(src = path,
           # very important to keep the adminLTE image border
           class = "profile-user-img img-responsive img-circle",
           alt = "User profile picture"
      )
    }
  }, deleteFile = FALSE)

  # generate the profile box
  output$profilebox <- renderUI({
    my_profile <- df$my_profile
    my_name <- my_profile$my_name
    my_position <- my_profile$my_position
    my_age <- my_profile$my_age
    my_interests <- my_profile$my_interests
    my_website <- my_profile$my_website
    my_teaser <- my_profile$my_teaser
    my_image <- my_profile$my_image

    profile_box(name = my_name, position = my_position, age = my_age,
                interests = my_interests, website_url = my_website,
                teaser = my_teaser, image = my_image, color = col)

  })


  #-------------------------------------------------------------------------
  #
  #  About section ...
  #
  #-------------------------------------------------------------------------

  # generate the about box
  output$aboutbox <- renderUI({
    about <- df$about
    my_phone <- about$my_phone
    my_mail <- about$my_mail
    my_location <- about$my_location
    my_linkedin <- about$my_linkedin
    my_twitter <- about$my_twitter
    my_facebook <- about$my_facebook
    my_github <- about$my_github
    my_stackoverflow <- about$my_stackoverflow

    # call the about_box function
    about_box(phone = my_phone, mail = my_mail, location = my_location,
              linkedin_link = my_linkedin, twitter_link = my_twitter,
              facebook_link = my_facebook, github_link = my_github,
              stackoverflow_link = my_stackoverflow)
  })
  
  #-------------------------------------------------------------------------
  #
  #  Download CV ...
  #
  #-------------------------------------------------------------------------
  
  # generate the about box
  output$downloadcvbutton <- renderUI({
    downloadButton("downloadCV", "Download CV", class = "white-color-text btn btn-primary btn-block")
  })
  
  output$downloadCV <- downloadHandler(
    filename = function() {
      paste("Vishal Sharma CV", ".pdf", sep = "")
    },
    content = function(file) {
      file.copy("www/Vishal CV Nov 2022.pdf", file)
    },
    contentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  )


  #-------------------------------------------------------------------------
  #
  #  skills section ...
  #
  #-------------------------------------------------------------------------

  # generate the radar plot of skills
  # Secure if skill dataframe is empty
  output$skillsradar <- renderPlot({
    skills <- df$skills

    if (!is_empty(skills)) {
      ggplot(data = skills, aes(x = variable, y = value, fill = value)) +
        geom_bar(stat = "identity") +
        coord_polar() +
        scale_fill_viridis_c() + xlab("") + ylab("") + theme_bw()
    }
  })

  # generate the skills box
  output$skillsbox <- renderUI({

    # skills and languages to pass to the box function
    my_skills <- df$skills
    my_languages <- df$languages

    #my_github_name <- input$github_name
    #github_calendar_state <- input$allow_github_calendar

    # global statistics
    total_projects <- nrow(df$projects)
    total_publications <- nrow(df$publications)
    total_conferences <- nrow(df$talks)
    total_courses <- sum(nrow(df$courses), nrow(df$internships))
    total_users <- nrow(df$users)

    # call the skill_box function
    skills_box(languages = my_languages,
               #github_name = my_github_name, allow_github_calendar = github_calendar_state,
               nb_projects = total_projects, nb_publications = total_publications,
               nb_conferences = total_conferences, nb_courses = total_courses,
               nb_users = total_users)

  })

  #-------------------------------------------------------------------------
  #
  #  network section ...
  #
  #-------------------------------------------------------------------------

  # generate the user box
  output$networkbox <- renderUI({
    users <- df$users
    # call the network_box function
    network_box(input, data = users, nb_users = nrow(users))
  })


  #-------------------------------------------------------------------------
  #
  #  formation section ...
  #
  #-------------------------------------------------------------------------

  # Render the formation timeLine
  output$formation_timeline <- renderUI({
    formations <- df$formations
    if (!is_empty(formations)) {
      tagList(
        timelineBox(
          lapply(seq_along(formations$title), FUN = function(i) {
            title <- formations$title[i]
            topic <- formations$topic[i]
            from <- formations$from[i]
            to <- if (is.na(formations$to[i])) "Now" else formations$to[i]
            summary <- formations$summary[i]
            place <- formations$place[i]
            supervisor <- formations$supervisor[i]
            grade <- formations$grade[i]
            extra <- formations$extra[i]
            list(
              timelineLabel2(
                text = HTML(paste0("<b>", from, " - ", to, "</b>")), color = col[i]
              ),
              timelineItem(
                icon = icon(name = topic, class = paste0("bg-", col[i])),
                header = if (length(grade) > 0) {
                  HTML(
                    paste0(
                      title,
                      tags$td(class = "mailbox-star",
                              tags$a(href = "#",
                                     if (grade < 5) {
                                       empty_star <- lapply(1:(5 - grade), FUN = function(i) {
                                         tags$i(class = "fa fa-star-o text-yellow pull-right")
                                       })
                                     },
                                     if (grade > 0) {
                                       full_star <- lapply(1:grade, FUN = function(i) {
                                         tags$i(class = "fa fa-star text-yellow pull-right")
                                       })
                                     }
                              )
                      )
                    )
                  )
                } else {
                  title
                },
                body = if (length(supervisor) > 0) {
                  HTML(paste0(summary, tags$br(), tags$br(), "<u>", "Advisors: ",
                              "</u>", "<b>", supervisor, "</b>"))
                } else {
                  summary
                },
                itemIcon = shiny::icon("street-view"),
                footer = tags$a(class = "btn btn-primary btn-xs", href = extra, "Read more"),
                itemText = place
              )
            )
          })
        )
      )
    }
  })

  #-------------------------------------------------------------------------
  #
  #  experience section ...
  #
  #-------------------------------------------------------------------------

  # render the project image
  observe({
    projects <- df$projects
    lapply(seq_along(projects), FUN = function(i) {
      output[[paste0("project_image", i)]] <- renderImage({
        path <- project_images[i]
        list(
          src = path,
          class = "img-circle"
        )
      }, deleteFile = FALSE)
    })
  })

  # render the project section
  output$experience <- renderUI({
    projects <- df$projects
    if (!is_empty(projects)) {
      tagList(
        lapply(seq_along(projects$title), FUN = function(i) {
          title <- projects$title[i]
          position <- projects$position[i]
          overview <- projects$overview[i]
          supervisors <- projects$supervisors[i]
          place <- projects$place[i]
          # call the project_box function and pass it all
          # the previous arguments
          project_box(title = title, position = position, overview = overview,
                      supervisors = supervisors, place = place, tasks = df$tasks[[i]],
                      background_color = col[i], box_index = i)
        })
      )
    }
  })


  #-------------------------------------------------------------------------
  #
  #  publications section ...
  #
  #-------------------------------------------------------------------------

  # render the uploaded images (works but not really nice)
  observe({
    screenshots <- df$publications_screenshots
    lapply(seq_along(screenshots), FUN = function(i) {
      output[[paste0("screenshot", i)]] <- renderImage({
        if (data_source == "manual") {
          # if datas are provided by the user, we use
          # the same path as with the demo code
          # so the image will be that choosen by the user
          # and not that by the demo
          if (view_mode == "local") {
            path <- screenshots[[i]]$src
          } else {
            temp_path <- screenshots[[i]]$src
            temp_path <- str_remove(temp_path, "/Users/macdavidgranjon/Desktop/MyShinyCV")
            path <- paste0(cv_path, temp_path)
          }
        } else {
          # if the user use the from_cvbuilder mode
          if (view_mode == "local") {
            data_path <- paste0(cv_path, "/www/cv_datas.rds")
            if (file.exists(data_path) == TRUE) {
              path <- paste0(cv_path, "/www/Publications_img_saved/", i - 1,".png")
            }
          } else {
            path <- paste0(cv_path, "/www/Publications_img_saved/", i - 1,".png")
          }
        }
        style <- screenshots[[i]]$style
        list(
          src = path,
          class = "img-responsive pad",
          style = if (!is.null(style)) style else NULL
        )
      }, deleteFile = FALSE)
    })
  })

  # render the project section
  output$publications <- renderUI({
    publications <- df$publications
    screenshots <- df$publications_screenshots
    if (!is_empty(publications)) {
      tagList(
        lapply(seq_along(publications$reference), FUN = function(i) {
          reference <- publications$reference[i]
          abstract <- publications$abstract[i]
          pubmed_link <- publications$pubmed_link[i]
          screenshot <- if (is_empty(screenshots)) {
            NULL
          } else {
            if (!is.null(screenshots[[i]]$src)) {
              screenshots[[i]]$src
            } else {
              NULL
            }
          }
          # call the publication_box function and pass it all
          # the previous arguments
          publication_box(reference, abstract, pubmed_link, screenshot,
                          box_index = i)
        })
      )
    }
  })

  #-------------------------------------------------------------------------
  #
  #  talks section ...
  #
  #-------------------------------------------------------------------------

  # Render the conference timeLine
  output$talk_timeline <- renderUI({
    talks <- df$talks
    if (!is_empty(talks)) {
      tagList(
        timelineBox(
          lapply(seq_along(talks$title), FUN = function(i) {
            title <- talks$title[i]
            from <- talks$from[i]
            to <- if (is.na(talks$to[i])) "Now" else talks$to[i]
            summary <- talks$summary[i]
            place <- talks$place[i]
            price <- talks$price[i]
            website <- talks$website[i]
            list(
              timelineLabel2(
                text = HTML(paste0("<b pads>", from, " - ", to, "</b>")), color = col[i]
              ),
              timelineItem(
                icon = icon(name = "microphone", class = paste0("bg-", col[i])),
                header = if (length(price) > 0) {
                  HTML(paste0(title, tags$p(class = "pull-right", icon("trophy"))))
                } else {
                  title
                },
                body = summary,
                itemIcon = shiny::icon("street-view"),
                footer = tags$a(class = "btn btn-primary btn-xs",
                                href = website, target = "_blank", "Read more"),

                itemText = place
              )
            )
          })
        )
      )
    }
  })


  #-------------------------------------------------------------------------
  #
  #  Teaching section ...
  #
  #-------------------------------------------------------------------------

  # render the teaching image
  observe({
    courses <- df$courses
    lapply(seq_along(courses), FUN = function(i) {
      output[[paste0("teaching_image", i)]] <- renderImage({
        path <- paste0(cv_path, "/www/presentation-2.svg")
        list(
          src = path,
          class = "img-circle"
        )
      }, deleteFile = FALSE)
    })
  })

  # render the teaching course boxes
  output$teaching_courses <- renderUI({
    courses <- df$courses
    if (!is_empty(courses)) {
      tagList(
        lapply(seq_along(courses$title), FUN = function(i) {
          title <- courses$title[i]
          topic <- courses$topic[i]
          nb_students <- courses$nb_students[i]
          nb_hours <- courses$nb_hours[i]
          from <- courses$from[i]
          to <- if (is.na(courses$to[i])) "Now" else courses$to[i]
          place <- courses$place[i]
          supervisor <- courses$supervisor[i]
          syllabus <- if (is.na(courses$syllabus[i])) NULL else courses$syllabus[i]

          # call the course_box function and pass it all
          # the previous arguments
          course_box(title, topic, nb_students, nb_hours, from, to,
                     place, supervisor, syllabus, box_index = i)
        })
      )
    }
  })

  # render the internship image
  observe({
    internships <- df$internships
    lapply(seq_along(internships), FUN = function(i) {
      output[[paste0("internship_image", i)]] <- renderImage({
        path <- paste0(cv_path, "/www/student.svg")
        list(
          src = path,
          class = "img-circle"
        )
      }, deleteFile = FALSE)
    })
  })

  # render the teaching internships boxes
  output$teaching_internships <- renderUI({
    internships <- df$internships
    if (!is_empty(internships)) {
      tagList(
        lapply(seq_along(internships$title), FUN = function(i) {
          title <- internships$title[i]
          topic <- internships$topic[i]
          from <- internships$from[i]
          to <- if (is.na(internships$to[i])) "Now" else internships$to[i]
          place <- internships$place[i]
          supervisor <- internships$supervisor[i]
          level <- internships$level[i]
          advert <- if (is.na(internships$advert[i])) NULL else internships$advert[i]

          # call the internship_box function and pass it all
          # the previous arguments
          internship_box(title, topic, from , to, place,
                         supervisor, level, advert, box_index = i)
        })
      )
    }
  })

  #-------------------------------------------------------------------------
  #
  #  main_box section ...
  #
  #-------------------------------------------------------------------------

  # need to enable/disable several tabPanels
  # Some users probably do not need
  # awards, talks and publications panels
  output$main_box <- renderUI({
    main_box(cv_mode)
  })

  #-------------------------------------------------------------------------
  #
  #  Useful tasks such as save, reset, load ...
  #
  #-------------------------------------------------------------------------

  # Custom footer
  output$dynamicFooter <- renderFooter({
    dashboardFooter(
      mainText = h5(
        "Vishal Sharma built this in 2020",
        "with",
        img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30"),
        "by",
        img(src = "https://www.r-project.org/logo/Rlogo.png", height = "30"),
        "and with", img(src = "love.png", height = "30")),
      subText = HTML("<b>Version</b> 0.3")
    )
  })

  # Set this to "force" instead of TRUE for testing locally (without Shiny Server)
  # Only works with shiny server > 1.4.7
  session$allowReconnect(TRUE)

})
