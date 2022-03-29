# Library App

This application is being build for the BWEP module in the Application Development minor.

## Local development

clone repo:

```bash
git clone https://github.com/JakeHU1/library_app
```

cd in repo and start docker-compose:
```bash
cd library_app
docker-compose up
```

load data:
```bash
cd dev-data/data
cat .\dummy_final.sql | docker exec -i library_app_db_1 psql -U postgres
```

The application is now running on http://localhost:8000. PgAdmin is running on http://localhost:8080.