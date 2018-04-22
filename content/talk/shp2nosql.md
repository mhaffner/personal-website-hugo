+++
date = 2017-01-01T00:00:00  # Schedule page publish date.
title = "The development of shp2nosql: Command line tools for spatial data and NoSQL databases"
time_start = 2017-04-05T13:00:00
time_end = 2017-04-05T13:20:00
abstract = "NoSQL databases are becoming the standard for big data analysts because of their flexibility and horizontal scalability. Unfortunately for geographers and GIScientists, however, there is considerable difficulty in importing geographic features into these databases due to little standardization. In the early stages of a project's life cycle, a researcher may be forced to master the intricacies of inserting/indexing records into many different databases simply for the sake of assessing features and capabilities. This process can be time-consuming and frustrating, detracting from the goals of the project. In this talk, I detail the development of a set of command line tools called 'shp2nosql' (analogous to PostgreSQL's 'shp2pgsql' tool), used to import US census TIGER files into various NoSQL databases such as MongoDB and ElasticSearch. Developed in the Bourne again shell (Bash) and capable of running on GNU/Linux systems, this tool relies on a minimal number of arguments from the user, and its commands are relatively consistent across databases. While these tools are useful in the short term, they are not an end-all solution to the lack of interoperability between database systems and spatial data. Rather, tools such as these will hopefully encourage a network of collaboration, eventually leading to the development of standards across databases. The software package will be hosted on GitHub, and collaboration from others is encouraged."
abstract_short = ""
event = "AAG Annual Meeting"
event_url = "http://www.aag.org/annualmeeting"
location = "Boston, MA"
draft = false

# Is this a selected talk? (true/false)
selected = false

# Projects (optional).
#   Associate this talk with one or more of your projects.
#   Simply enter the filename (excluding '.md') of your project file in `content/project/`.
#   projects = ["deep-learning"]

# Links (optional).
url_pdf = ""
url_slides = "https://mhaffner.github.io/presentations/shp2nosql.html"
url_video = ""
url_code = "http://github.com/mhaffner/shp2nosql"

# Does the content use math formatting?
math = false

# Does the content use source code highlighting?
highlight = false

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""
+++
