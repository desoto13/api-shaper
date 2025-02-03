# API Shaper

## Versions
below are the versions used to create this app
- ruby 3.1.2
- Rails 7.2.2.1
- node v22.2.0
- yarn 1.22.19
- database: postgres (PostgreSQL) 15.1

## Getting Started

Clone the repo:
```sh
git@github.com:desoto13/api-shaper.git
```

Run the bundler
```sh
bundle install
```

Assuming the postgresql has already been setup with the app, intiate the database
```sh
pg_ctl start
(Note: kindly create a postgres user profile api_shaper via postgres CLI) 
rails db:create
```
Run the migrations
```sh
rails db:migrate
```

## Running the app
Run the server
```sh
rails s
```

## API definitions

| VERB | Endpoints | Description |
|:----:|:---------:|:-----------:|
| POST | /api/v1/reservations | Create Reservations |

Note: The assumption is id or guest_id is a government id_number
