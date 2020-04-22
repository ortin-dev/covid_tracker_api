# CovidTrackerApi

Corona Virus Statistics API. All statistics data and cases along with confirmed, recovered and deaths from all around the world.

## Usage

The first one you must define client:

```ruby
client = CovidTrackerApi::Client.new('api_key')
```

You can get all data:

    client.all

Or you can get data for special country

    client.all('US')
    client.all('US').confirmed
    client.all('US').deaths
    client.all('US').recovered


Also you can get statistics data:

    client.statistics

Or you can get statistics for special country

    client.statistics('US')

Available countries:
    
    US
    Denmark

## Source API

Source API Documentation: https://rapidapi.com/alitugrulcebe/api/covid19-tracker

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
