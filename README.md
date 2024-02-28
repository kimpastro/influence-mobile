# Offer Claim Project
As this project has no intent on going to production, follow the instructions to run it into your machine.

## Running it locally

> Make sure you have postgres up and running into your machine
> and adjust the .env.development DATABASE_URL values to match you local postgres credentials

In order to install you must run:
```sh
bin/setup
```

To create some offers and an initial user, run:
```sh
bin/rails db:seed
```
It will print out valid credentials so you can access the system.

To start the server:
```sh
bin/dev
```

Now access:
`http://localhost:3000`


## Running it with docker-compose

> You need docker-compose installed into your machine

Start the application:
```sh
make up
```

Access:
`https://localhost:3000`

Stop the application:
```sh
make stop
```

Cleaning up things (Remove containers, images and volumes):
```
make clean
```
