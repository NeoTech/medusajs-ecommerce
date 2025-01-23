# Builder folders.
This is where you generate your medusa project images.

You will need to run thru a multistage build for this.

Easiest is to build each stage seperatly.

```bash
docker build --target build -t medusa-build:latest .
docker build --target front -t medusa-frontend:latest .
docker build --target back -t medusa-backend:latest .
```
Doing so will create the necessary caches - and you get he correct

naming conections for the docker-compose file in the parent folder.
