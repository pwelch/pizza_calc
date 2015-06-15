# PizzaCalc

Util for calculating pizza order requirements.

## API

```bash
  curl -X POST http://pizzacalc.website/api/pizza_calc/3
```

## Running Locally

Start Sinatra App
`rackup`

Visit
`http://localhost:9292`

## Development

Run All Tests:
`bundle exec rake`

Local API:
`curl -X POST http://localhost:9292/api/pizza_calc/3`

## CI

[![Build Status](https://secure.travis-ci.org/pwelch/pizza_calc.svg)](http://travis-ci.org/pwelch/pizza_calc)

## Contributing

1. Fork it ( https://github.com/pwelch/pizza_calc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
