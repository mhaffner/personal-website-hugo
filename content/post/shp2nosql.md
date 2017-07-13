+++
date = "2017-04-12T00:00:00"
draft = false
tags = ["Bash", "NoSQL", "GeoJSON", "Shapefile"]
title = "The development of shp2nosql"
summary = "A short summary of my motivation for developing `shp2nosql`"
math = false
+++

In the early days of my dissertation, I was collecting Twitter data but had no
idea how to store, manage, or query these data. First, I tried PostgreSQL with
PostGIS. I had been wanting to learn PostGIS anyway, not to mention a suitable
alternative to MS SQL Server. After learning PostGIS's intricacies, I soon found
it was unsuitable for my needs. After some searching, I stumbled upon MongoDB.

Subsequently, I started using MongoDB to handle my data. Working with MongoDB
requires at least _some_ knowledge of JavaScript, which I was wanting to learn
anyway, so I didn't mind this switch. This worked somewhat better than
PostgreSQL since MongoDB is good at handling semi-structured data (like those
from Twitter), but sharding was not intuitive, inserting spatial data was
difficult, and queries were still slow. At the _CyberGIS and GeoSpatial Data
Science_ conference/workshop at the University of Illinois in the summer of
2016, I was introduced to Elasticsearch.

So I started using Elasticsearch to handle my data. After many painstaking
attempts to index geographic data in Elasticsearch, I was becoming concerned
that I'd spend the next several years trying a never-ending list of databases,
learning new skills, drowning in the digital sea..... and never complete my
dissertation. Thankfully, with the help
of
[MapButcher's tutorial](https://www.gitbook.com/book/mapbutcher/using-spatial-data-in-elasticsearch/details),
I was finally able to index my data and perform spatial queries in a reasonable
amount of time.

My search for a suitable database stopped after three. This process was
incredibly valuable in that I learned many new skills and created some useful
tools for myself, but ten months had elapsed before I found a suitable workflow.
I thought, _What about researchers who don't have ten months to spare learning
the intricacies of multiple databases_? I now had three different workflows for
working with spatially enabled databases, but each was somewhat clunky. Since I
knew I'd be working with Elasticsearch for quite some time, it was in my best
interest to create something more efficient. If I could make a generalizable
tool, others could benefit from it and avoid some of the mishaps I encountered
along the way. Combine these elements with my need to present something at the
_AAG Annual Meeting_ (and save dissertation article presentations for later),
and the stars had wonderfully aligned. I decided to create a software tool to
aid geographers in inserting/indexing spatial data.

There really was no need to create a _shapefile to PostGIS_ tool, since it
already exists: `shp2pgsql`. What I needed (and sought to create) was the NoSQL
equivalent, which I call `shp2nosql`. Currently it works with Elaticsearch and
MongoDB, but I'd love others to contribute and make the tool more robust,
suggest new features, and possibly support more databases. Technical details can
be found on my GitHub page [here](https://github.com/mhaffner/shp2nosql), and
the presentation I delivered at the AAG Annual Meeting can be
found [here](https://mhaffner.github.io/presentations/shp2nosql.html).
