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
bundle exec rake db:create
```

#### Structure and data

```shell
# Create table and columns
bundle exec rake db:migrate

# Reset and create table and columns
bundle exec rake db:migrate:reset

# Insert data
bundle exec ruby seed.rb

# Insert data after delete them
bundle exec rake db:seed:replant
```

#### ERD diagram

```shell
bundle exec rake document:erd title="poo1_2022_shop" sources="./connection.rb,./models.rb"
```

## Tests

It's recommended to refresh the database with data before execute new tests.

```shell
bundle exec rake test TESTOPTS='-v
```

## Contributing

See [Ex2](Ex2.md) and [EX2 suite](Ex2-suite.md) for more details about what to do.
