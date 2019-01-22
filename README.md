# Docker container for MongoDB + ElasticSearch

A setup to get a fully working docker container, containing MongoDB (with mongo-express) + ElasticSearch (with kibana).

We use [monstache](https://github.com/rwynn/monstache) to index data from MongoDB to ElasticSearch.

# Requirements
* [Docker](https://www.docker.com/)
* [Docker-compose](https://docs.docker.com/compose/install/)

# How to get started (Ubuntu)
1. Clone this repo
2. Open a terminal in the repo-folder.
3. Run `docker-compose up`

# How to get started (Windows)
1. Clone this repo
2. Open a terminal in the repo-folder.
3. Run `docker-compose up`
If that's not working you'll might have to set [COMPOSE_CONVERT_WINDOWS_PATHS](https://docs.docker.com/compose/reference/envvars/)


That's it.
