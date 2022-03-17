# Poo1 exo2 - Shop

## Installation

```shell
bundle install
```

## Usage

### Database

Change variable in `db/config.yaml` if needed.

#### Creation

```shell
rake db:create
```

#### Structure and data

```shell
# Create table and columns
rake db:migrate

# Reset and create table and columns
rake db:migrate:reset

# Insert data
ruby seed.rb
```

#### ERD diagram

```shell
rake document:erd title="poo1_2022_shop" sources="./connection.rb,./models.rb"
```

## Tests

It's recommended to refresh the database with data before execute new tests.

```shell
bundle exec rake test
```

## Contributing

See [Ex2](Ex2.md) for more details about what to do.
