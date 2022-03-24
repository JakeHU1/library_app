# Library App

This application is being build for the BWEP module in the Application Development minor.

## Local development

Local development is done using Docker and Docker Compose. Both are required to run the application in development. The Dockerfile and docker-compose file are located in the root folder. The Dockerfile is used to build the image and the docker-compose file is used to run the image together with a PostgreSQL database.
To start the local development environment, run the following command ():

```bash
docker-compose up
```

The application is now running on port 8000:

```bash
http://localhost:8000
```

PgAdmin is now running on port 8080:

```bash
http://localhost:8080
```

Add the postgres database --> right-click servers --> register --> server...
Name: This_doesn't_matter
connection --> Host: db
Password: Pa$$w0rd

And you're done! If all went well, you can see the dummy data loaded into the database.

## manage.py

If we need to do a database migration, we can use the manage.py command in Docker-compose:

```bash
docker-compose run web python manage.py migrate
```
docker-compose run web python manage.py inspectdb > models_generated.py
docker exec -t library_app_db_1 pg_dumpall -c -U postgres > dummy_final.sql
