## Dev Setup

0. Have Docker installed
1. `git clone` this repository
2. `docker-compose up -d`
3. `docker-compose run web rake db:setup` (this also seeds the DB)
4. Access the application on $docker_host:3000
