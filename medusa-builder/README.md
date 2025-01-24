# Builder folders.
This is where you generate your medusa project images.

You will need to run thru a multistage build for this.
Trying to optimized this and rework it to not use the NPX command
was alot more work than i wanna put on this.

Ended up using the "full" install in the backend image just because if you
dont the install will somehow "skip" installing anything at all due to some
input bug in the npx command or how the scripts behave. Deal with it.

Easiest is to build each stage seperatly.

```bash
docker build --target front -t medusa/frontend:latest .
docker build --target back -t medusa/backend:latest .
```
Doing so will create the necessary caches - and you get he correct

naming conections for the docker-compose file in the parent folder.
