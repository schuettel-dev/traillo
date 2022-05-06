# Traillo

A showcase how to use Hotwired.

## Preconditions

Have a redis server running.

## Setup

```sh
rails new traillo \
  --database=sqlite3 \
  --skip-action-mailer \
  --skip-active-job \
  --skip-jbuilder \
  --css=tailwind
```

```sh
bin/rails action_text:install
bundle
bin/rails db:migrate
```

```sh
bin/rails generate scaffold ListItem \
  title:string \
  description:rich_text \
  list_position:integer
bin/rails db:migrate
```

```sh
bin/dev
```

Open: http://localhost:3000/list_items
