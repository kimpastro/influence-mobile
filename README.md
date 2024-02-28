# Offer Claim Project
As this project has no intent on going to production, follow the instructions to run it into your machine.

## Running it locally

> Make sure you have postgres up and running into your machine
> and adjust the .env.development DATABASE_URL values to match you local postgres credentials
In order to install you must run:
```sh
bin/setup
```

To create some offers and a initial user, run:
```sh
bin/rails db:seed
```
It will print out valid credentials so you can access the system.

## Running the project:

> Duplicate or rename the `.env.example` to `.env.development.local` and change the `DATABASE_URL` value to match with your already installed postgresql database running locally.


To start the server:
```sh
bin/dev
```

Now access:
`http://localhost:3000`


## Running it with docker

> You need docker-compose installed locally.

Running the application:
```sh
make up
```

And access:
`https://localhost:3000`

Stopping the application:
```sh
make stop
```

Cleaning up:
```
make clean
```
