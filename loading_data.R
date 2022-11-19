library(shinyCV)
library(lubridate)

# datas for the profile example
temp_profile <- list(
  my_name = "Vishal Sharma",
  my_position = "Senior Analyst Modeller - Pricing (A&BI)",
  my_age = year(Sys.Date()) - year(as.Date("1994-03-30")),
  my_interests = c(
    "R Programming",
    "Statistics",
    "Visualisations",
    "Python",
    "SQL",
    "Machine Learning",
    "Shiny",
    "LaTeX"
  ),
  my_website = "https://beta.rstudioconnect.com/connect/#/apps/f7665624-e55e-45c7-851c-66f09b283861/access",
  my_teaser = paste0(
    "Highly analytical and process-oriented scientist, strategist, and technical community builder with",
    year(Sys.Date()) - 2015,
    " years of cross-industry experience in numerous data science activities. Passionate about integrating statistical and computation methods into digital products to drive business value. I am a driven leader with interdisciplinary, technical background, combining academic curiosity with industry best practices. I greatly value mentorship, collaborative team building, creative solutioning, transparency, and personal growth. Research scholar with ongoing research on Deepfake detection technology with publications in progress."
  ),
  my_image = list(# src = system.file("./www/Vishal.jpg", package = "shinyCV"),
    src = "./www/Vishal.jpg",
    # very important to keep the adminLTE image border
    class = "profile-user-img img-responsive img-circle",
    alt = "User profile picture")
)

# datas for about example
temp_about <- data.frame(
  my_phone = "+91 999 00 23450",
  my_mail = "vishalsharma3003@gmail.com",
  my_location = "Noida, Uttar Pradesh, India",
  my_linkedin = "https://www.linkedin.com/in/vishalsharma3003/",
  my_twitter = "https://twitter.com/MaggleBoy",
  my_facebook = "https://www.facebook.com/niceboy33/",
  my_github = "https://github.com/vishalsharma3003",
  my_stackoverflow = "https://stackoverflow.com/users/12262111/vishal-sharma"
)

# datas for skills example
temp_skills <- data.frame(
  variable = c("R", "Python", "SQL", "Visualisation", "Machine Learning"),
  value = c(80, 50, 60, 80, 50)
)

# datas for language example
temp_languages <- data.frame(variable = c("English", "Hindi", "Punjabi"),
                             value = c(90, 90, 30))

# datas for network example
temp_network <- data.frame(
  title = c("Dr.", "Dr.", "Mr.", "Ms."),
  sex = c("male", "male", "male", "female"),
  name = c(
    "Quentin Caudron",
    "Rakesh Garg",
    "Shane Trefftzs",
    "Yogeeta Sharma"
  ),
  mail = c(
    "quentin.caudron@gmail.com",
    "rkgarg04@gmail.com",
    "shane.trefftzs@gmail.com",
    "yogeeta.sharma@gmail.com"
  ),
  phone = c("", "", "", "")
)

# datas for formation example
temp_formations <- data.frame(
  title = c(
    "PhD - Doctorate",
    "M.Tech - Master Degree",
    "B.Tech - Bachelor Degree",
    "12th - Intermediate"
  ),
  topic = c(
    "Computer Science & Engineering",
    "Computer Science & Engineering",
    "Computer Science & Engineering",
    "Physics, Chemistry, Maths"
  ),
  from = c("August 2021", "July 2017", "August 2011", "April 2010"),
  to = c(
    ifelse(year(Sys.Date()) > 2025, "June 2025", "Ongoing"),
    "June 2020",
    "July 2015",
    "March 2011"
  ),
  summary = c(
    "Research Area: Deepfake Detection",
    "Research Area: House Price Prediction",
    "Project Area: Inventory Management",
    "CBSE Board"
  ),
  place = c(
    "Amity University",
    "Birla Institute of Technology & Science",
    "Inderprastha Engineering College",
    "Modern School"
  ),
  supervisor = c(
    "Quentin Caudron, PhD",
    "Mr. Tarun Singh",
    "Mr. Mandeep Katre",
    "Dr. A. K. Singh"
  ),
  grade = c(9, 8.4, 7.3, 8.9),
  extra = c(
    "Thesis Title: Detecting DeepFake Videos Based on Spatio-temporal Features & Audio-Visual Modalities Using Artificial Intelligence",
    "Masters in Technology with Software Systems and specialization in Data Science",
    "Bachelor's in Technology",
    "Intermediate done with Physics, Chemistry and Maths (Science Stream)"
  )
)

# datas for task example
temp_tasks <- list(
  # one task dataframe per project
  project1 = data.frame(
    name = c("Data Quality Dashboard", "Revaluation Automation", "Channel Mix Model"),
    status = rep("wip", 3)
  ),
  project2 = data.frame(
    name = c("Identifying prospective investment opprotunity", "Pricing of Portfolio", "Prediction of Risk on the portfolio"),
    status = rep("completed", 3)
  ),
  project3 = data.frame(
    name = c("Optimization of Shiny Dashboard", "Tableau Dashboard for Deals"),
    status = rep("completed", 2)
  ),
  project4 = data.frame(
    name = c("Data Standardization", "QA Automation", "Code Rationalisation"),
    status = rep("completed", 3)
  ),
  project5 = data.frame(
    name = c(
      "Performing Loans Modeling",
      "Non Performing Loans Modeling",
      "Data Preparation Functions"
    ),
    status = rep("completed", 3)
  ),
  project6 = data.frame(
    name = c("Shiny User Interface", "Deployment"),
    status = rep("completed", 2)
  ),
  project7 = data.frame(
    name = c("Shiny User Interface", "Python API Gateway"),
    status = rep("completed", 2)
  ),
  project8 = data.frame(
    name = c(
      "Markdown Exploratory Data Analysis",
      "Geocoder",
      "Tidy Data using Tidyr"
    ),
    status = rep("completed", 3)
  ),
  project9 = data.frame(
    name = c(
      "Term Deposit Subscription",
      "Anaomaly Detection",
      "Modelling",
      "Attribute Information Analysis"
    ),
    status = rep("completed", 4)
  ),
  project10 = data.frame(
    name = c(
      "Outlier Detection",
      "House Type Frequencies",
      "Time Series Analysis",
      "	Price Prediction Model"
    ),
    status = rep("completed", 4)
  ),
  project11 = data.frame(
    name = c(
      "Bank Switching Analysis & Development",
      "Code Reviews",
      "Knowledge Sharing Session"
    ),
    status = rep("completed", 3)
  ),
  project12 = data.frame(
    name = c("Impact Analysis", "Identification of Resolver Group"),
    status = rep("completed", 2)
  )
)

# datas for project example
temp_projects <- data.frame(
  title = c(
    "Minerva Product Analytics",
    "Portfolio Pricing",
    "Amitra Optimisation",
    "Delivery Engine",
    "Pricing Engine",
    "Portfolio Transformation Calculator",
    "Pathfinder",
    "Enterprise Analytics",
    "Sopra Banking Platform",
    "House Price Prediction",
    "Analysis and Development in Payments",
    "Airbus"
  ),
  position = c(
    "Senior Analyst - Modeler",
    "Senior Analyst - Modeler",
    "Senior Analyst - Modeler",
    "Senior Analyst - Modeler",
    "Senior Analyst - Modeler",
    "Data Scientist",
    "Data Scientist",
    "Data Scientist",
    "Data Scientist",
    "Junior Data Scientist",
    "Junior Data Scientist",
    "Junior Data Scientist"
  ),
  overview = c(
    "Competetive analysis and brainstorming to offer more services and product offerings to the clients",
    "Pricing prospective investment opportunities and existing investments on Performing loans, Non-performing loans, and securitisation pricing",
    "Shiny dashboard runtime optimization and creation of a new tableau dashboard of Servicers",
    "Prediction of new categorical variables' values and rationalisation of code across teams",
    "Creating a modeling framework for PL, NPL, and utility function for data preparation and tidyness of data",
    "Creating a portfolio transformation calculator to identify the potential savings in the post covid scenario with limited occupancy in offices",
    "Pathfinder shiny application with UI in Shiny and backend using Python API Gateway implementation",
    "Exploratory Data Analysis report automation using R markdown for lease admin and servicers",
    "National Savings and Investments (NS&I), formerly called the Post Office Savings Bank and National Savings, is a state-owned savings bank in the United Kingdom. It is both a non-ministerial government department and an executive agency of the Chancellor of the Exchequer.",
    "Acorn Properties are a well-established, vibrant family business providing residential sales and lettings working across UK. They are recognised for their knowledge and vast experience within the lettings sector. Here I was working on the client site in UK Acorn office.",
    "Sopra Banking Platform is a platform that provides various services to different banks and financial institutions. Here I was working mainly on Payment Engine, Standing Orders, National Cheques, Remittances, Bank switching, Cards management in Europe, SEPA, EPC regulations and more similar stuff.",
    "Airbus is one of the largest manufacturers of aerospace vehicles. It is mainly located in Europe but serves worldwide. It is a leader in innovating aerospace business and aerospace vehicles."
  ),
  supervisors = c(
    "Saurabh Sharma",
    "Vimal Chaudhary",
    "Rahul Maggo",
    "Utkarsh Srivastava",
    "Vimal Chaudhary",
    "Shane Trefftzs",
    "Shane Trefftzs",
    "Inderpaul Singh",
    "Rama Sharma",
    "Robert Allison",
    "Gaurav Gupta",
    "Sauveer Goel"
  ),
  place = c(
    "Noida, Uttar Pradesh, India",
    "Noida, Uttar Pradesh, India",
    "Noida, Uttar Pradesh, India",
    "Noida, Uttar Pradesh, India",
    "Noida, Uttar Pradesh, India",
    "Gurugram, Haryana, India",
    "Gurugram, Haryana, India",
    "Gurugram, Haryana, India",
    "Noida, Uttar Pradesh, India",
    "Durham, United Kingdom",
    "Brussels, Belgium",
    "Noida, Uttar Pradesh, India"
  )
)

# datas for publications screenshots
demo_list <- list(
  class = "img-responsive pad",
  src = system.file("App/cv_viewer/www/text-lines.svg", package = "shinyCV"),
  style = "height: 100px; display: block;
    margin-left: auto; margin-right: auto;"
)
temp_publications_screenshots <-
  list(demo_list, demo_list, demo_list)

# data for publication example
temp_publications <- data.frame(
  reference = rep("Your name et al., Journal Title, 2018", 3),
  abstract = rep(
    "Lorem ipsum dolor sit amet, consectetur
                   adipiscing elit, sed do eiusmod tempor
                   incididunt ut labore et dolore magna aliqua.
                   Ut enim ad minim veniam, quis nostrud exercitation
                   ullamco laboris nisi ut aliquip ex ea commodo
                   consequat. Duis aute irure dolor in reprehenderit in
                   voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                   Excepteur sint occaecat cupidatat non proident, sunt in
                   culpa qui officia deserunt mollit anim id est laborum.",
    3
  ),
  pubmed_link = rep("https://www.ncbi.nlm.nih.gov/pubmed", 3)
)


# datas for talk example
temp_talks <- data.frame(
  title = c(
    "Equipped Analytical Intelligence",
    "CBRE",
    "NS&I",
    "Sopra Banking Software"
  ),
  from = c("July 2021", "January 2020", "May 2018", "July 2015"),
  to = c("Current", "June 2021", "April 2019", "January 2020"),
  summary = c(
    "Equipped AI combine data science and technology to provide actionable insights into clients' portfolios. The state-of-the-art R, Python, SaaS intelligence platform, Minerva, enables investors to collect, compile, analyse and better understand data to help them make important decisions and ultimately produce superior returns.",
    "CBRE Group, Inc. is an American commercial real estate services and investment firm. The abbreviation CBRE stands for Coldwell Banker Richard Ellis. It is the largest commercial real estate services company in the world. The firm is ranked 128th on the Fortune 500 and has been included in the Fortune 500 every year since 2008. CBRE serves more than 90 of the top 100 companies on the Fortune 100.",
    "National Savings and Investments (NS&I), formerly called the Post Office Savings Bank and National Savings, is a state-owned savings bank in the United Kingdom. It is both a non-ministerial government department and an executive agency of HM Treasury. The aim of NS&I has been to attract funds from individual savers in the UK for the purpose of funding the government's deficit. NS&I attracts savers through offering savings products with tax-free elements on some products, and a 100% guarantee from HM Treasury on all deposits. As of 2017, approximately 9% of the government's debt is met by funds raised through NS&I, around half of which is from the Premium Bond offering.",
    "Sopra Steria Group SA (commonly referred to as Sopra Steria) is a European information technology (IT) consultancy established in September 2014 upon the merger of Sopra Group SA and Groupe Steria SCA (commonly referred to as Sopra and Steria, respectively). Technically, Sopra was the company to adopt the new name, retaining its legal personality. The primary business areas of the company include consulting services, systems integration, integration of ERP, implementation of applications, as well as providing technical support to users and application maintenance and outsourcing services and operation of professional processes. Sopra Steria has been alleged of exploitative behaviour towards those seeking UK status."
  ),
  place = c(
    "Noida, Uttar Pradesh, India",
    "Gurugram, Haryana, India",
    "Durham, United Kingdom",
    "Noida, Uttar Pradesh, India"
  ),
  website = c(
    "https://www.equipped.ai/",
    "https://www.cbre.com/",
    "https://www.nsandi.com/",
    "https://www.soprabanking.com/"
  )
)

# datas for course example
temp_courses <- data.frame(
  title = c(
    "Statistics: Making Sense Out of Data",
    "Statistical Inference",
    "R Programming",
    "Data Science Toolbox",
    "The Analytics Edge",
    "Introduction to R",
    "Intermediate R",
    "Introduction to Tidyverse",
    "Data Manipulation in R with dplyr",
    "Learning Python",
    "Python for Data Science",
    "Introduction to Python",
    "Intermediate Python"
  ),
  topic = c(
    "Tables & Graphs, Descriptive Statistics, Inferential Statistics, Prediction",
    "Probability & Expected value, Variability, Intervals",
    "Loop, Functions, Debugging, Simulation, Profiling",
    "Data Science Fundamentals, R & R Studio, R Markdown",
    "Introduction to Analytics, Regression, Trees, Clustering, Visualisation",
    "Vectors, Matrices, Factors, Data Frames, Lists",
    "Conditional & Control Flow, Loops, Functions, apply family",
    "Data Wrangling, Data Visualization, Grouping & Summarising",
    "Aggregating Data, Selecting Data",
    "Python Basics, Date & Time, Web Data",
    "Data Prepration, Data Visualizations, Basic Math & Statistics, Web Scraping",
    "Basics, Lists, Functions, Packages, Numpy",
    "Matplotlib, Dictionaries, Pandas, Control Flow, Loops"
  ),
  # nb_students = c(10, 100, 4, 250),
  nb_hours = c(20, 54, 52, 4, 60, 4, 6, 4, 4, 3, 6, 5, 4),
  from = c(
    '2016-05-06',
    '2016-06-01',
    '2016-08-15',
    '2016-11-12',
    '2017-02-01',
    '2017-02-02',
    '2017-05-15',
    '2017-06-01',
    '2017-07-01',
    '2020-03-01',
    '2020-03-16',
    '2020-04-01',
    '2020-04-10'
  ),
  to = c(
    '2016-05-20',
    '2016-07-30',
    '2016-10-30',
    '2016-11-20',
    '2017-02-01',
    '2017-04-30',
    '2017-05-20',
    '2017-06-15',
    '2017-07-15',
    '2020-03-15',
    '2020-03-30',
    '2020-04-08',
    '2020-04-15'
  ),
  place = c(
    'Coursera',
    'Coursera',
    'Coursera',
    'Coursera',
    'EdX',
    'Datacamp',
    'Datacamp',
    'Datacamp',
    'Datacamp',
    'LinkedIn',
    'LinkedIn',
    'Datacamp',
    'Datacamp'
  ),
  supervisor = c(
    'Glenn J. Myatt',
    'Brian Caffo, PhD',
    'Jeff Leek, PhD',
    'Roger D. Peng, PhD',
    'MIT',
    'Jonathan Cornelissen',
    'Filip Schouwenaars',
    'David Robinson',
    'Chris Cardillo',
    'Joe Marini',
    'Lillian Pierson, P.E.',
    'Hugo Bowne-Anderson',
    'Hugo Bowne-Anderson'
  ),
  syllabus = c(
    'https://onlinelibrary.wiley.com/doi/book/10.1002/0470101024',
    'https://www.coursera.org/learn/statistical-inference#syllabus',
    'https://www.coursera.org/learn/r-programming',
    'https://www.coursera.org/learn/data-scientists-tools',
    'https://courses.edx.org/courses/course-v1:MITx+15.071x_2a+2T2015/4264e68418f34d839cf0b33a5da644b2/',
    'https://learn.datacamp.com/courses/free-introduction-to-r',
    'https://learn.datacamp.com/courses/intermediate-r',
    'https://learn.datacamp.com/courses/introduction-to-the-tidyverse',
    'https://learn.datacamp.com/courses/data-manipulation-with-dplyr',
    'https://www.linkedin.com/learning/learning-python-2/',
    'https://www.linkedin.com/learning/python-for-data-science-essential-training-part-1/',
    'https://learn.datacamp.com/courses/intro-to-python-for-data-science',
    'https://learn.datacamp.com/courses/intermediate-python-for-data-science'
  )
)

# datas for internship example
temp_internships <- data.frame(
  title = c("Bharat Electronics Limited"),
  topic = c("Computer Science"),
  from = c("2014-06-01"),
  to = c("2014-08-30"),
  place = c("Bharat Electronics Limited (BEL), Sahibabad"),
  supervisor = c("Ram Dutt Sharma"),
  level = c("Bachelor"),
  advert = c("http://www.bel-india.in/")
)

datas <-
  feed_shinyCV(
    temp_profile,
    temp_about,
    temp_skills,
    temp_languages,
    temp_network,
    temp_formations,
    temp_projects,
    temp_tasks,
    temp_publications,
    publications_screenshots = list(),
    temp_talks,
    temp_courses,
    temp_internships
  )
readr::write_rds(datas, file = "www/cv_datas.rds")