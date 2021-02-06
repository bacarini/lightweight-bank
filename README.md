# lightweight-bank

API to receive bulk transfer requests.

# Requirement

In order to run this project it is needed to have installed ruby and [bundle](https://bundler.io/)

# Development

Install the dependencies
```
bundle install --path vendor/bundle
```

and run
```
bundle exec rackup
```

After you run the command above the web server should be running. To access localhost use the following endpoint `http://127.0.0.1:9292`

# Test

To test just run the command below
```
bundle exec rspec spec
```

# System design

### Routers
Layer responsible to accept the request and call the respective handler.

### Handler
Layer responsible to hold all the steps that the action is supposed to do and orchestrate accordingly.

### Services
Small classes that holds the business logic

### Model
Database entities


# Improvements

- Implement the debit service
- Increase test coverage
- Validate edges cases
