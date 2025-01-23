# medusa-js
My exploration of medusa

# Traefik provides Proxy
```bash
sudo ./traefik --log.level=DEBUG --configfile=traefik.yml
```
This allows you to run your dev environment on another box somewhere.
Note, that traefik could be run from docker-compose as well.

# PSQL running in docker.
To just run the DB and make sure it works generat the certs.
And the run the Docker compose up command - that will generate the necssar
pgdata folders and such.
```bash
./gen-ssl.sh
docker-compose up db -d
```

# Stripe instructions for V2.3.1
https://docs.medusajs.com/resources/commerce-modules/payment/payment-provider/stripe#main
