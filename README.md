# soundx.cr

Generate Soundex code from names

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     soundx:
       github: jamescook/soundx.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "soundx"

Soundx.encode("bobby")
```

## Contributing

1. Fork it (<https://github.com/jamescook/soundx.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [James Cook](https://github.com/jamescook) - creator and maintainer
