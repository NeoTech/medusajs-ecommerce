# medusa-js
My exploration of medusa

# Traefik provides Proxy
```bash
sudo ./traefik --log.level=DEBUG --configfile=traefik.yml
```
This allows you to run your dev environment on another box somewhere.

# PSQL running in docker.
```bash
docker-compose -f docker-compose.psql.yml up -d
```
Just gives you a database to start with.

# Stripe instructions for V2.3.1
https://docs.medusajs.com/resources/commerce-modules/payment/payment-provider/stripe#main
